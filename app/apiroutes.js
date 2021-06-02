const orm = require('./orm');
const fs = require('fs')
const multer  = require('multer')
const crypto = require('crypto')


var storage = multer.diskStorage({
    destination: function (req, file, cb) {
      cb(null, 'public/assets/player_photos')
    },
    filename: (req, file, cb) => {
        let customFileName = crypto.randomBytes(18).toString('hex'),
            fileExtension = file.originalname.split('.')[1] // get file extension from original file name
            cb(null, customFileName + '.' + fileExtension)
         }
  })
   
  var upload = multer({ storage: storage })





// auto email variables
  var nodemailer = require('nodemailer');

  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'canadasgame411@gmail.com',
      pass: 'vmkcrecgnfdlxdmi'
    }
  });
  

















function router (app){
    // saving JSON to file
    const savePlayers = './.playersList.json'

    // Data ======================================================
    let playersList = fs.existsSync(savePlayers) ?
        JSON.parse( fs.readFileSync(savePlayers) ) : []

    // EndPoints =======================================================

    // send playlist from JSON to the /api/player path
    app.get('/api/player', function(req, res){
        res.send( playersList )
    })

    app.get("/api/player/edit/:id", async function(req, res ){
        console.log(`this is the id from SERVER`,req.params.id);
        let player = await orm.getPlayer( req.params.id );
       
        res.send( player );
      });

    // pull from db and generate html card
    
    app.get('/api/team/:teamname', async function(req, res){
        console.log(req.params.teamname)
        let teamPlayers = await orm.getTeam(req.params.teamname)
        console.log(teamPlayers)
        res.send(teamPlayers)
    })
    
    app.get('/api/available', async function(req, res){
        console.log('we are at api/available')
        let availablePlayers = await orm.getAvailable()
        console.log('These are the', availablePlayers)
        res.send(availablePlayers)
    })



    // post, adjusted to account for photo upload by adding the upload.single
    app.post('/api/player/new', upload.single('avatar'), async function(req, res){
        
        // this is a combined object which includes the photo details and the form post details
        const newPlayerData = req.body
        const newPlayerPhoto = req.file
     
        
        const newfullPlayerDetails = {
            ...newPlayerData,
            ...newPlayerPhoto
        }
         console.log(`[submit button pushed] Here is the combined object with forma and photo details`, newfullPlayerDetails)

        // req.body fields to constansts
        const firstName = req.body.first_name;
        const lastName = req.body.last_name;
        const birthDate = req.body.birth_date;
        const email = req.body.email;
        const street = req.body.street;
        const city = req.body.city;
        const postalCode = req.body.postal_code;
        const province = req.body.province;
        const friendName = req.body.friend_name;
        const position = req.body.position;
        const skill = req.body.experience;
        const coach = req.body.coach;
        // req.file fields to constants - nothing is passed if no pic uplaoded so we need blank spaces
        const fieldname =  req.file && req.file.fieldname ? req.file.fieldname : "";
        const originalname = req.file && req.file.originalname ? req.file.originalname: "";
        const encoding = req.file && req.file.encoding ? req.file.encoding: "";
        const mimetype = req.file && req.file.mimetype ? req.file.mimetype: "";
        const destination = req.file && req.file.destination ? req.file.destination : "";
        const filename = req.file && req.file.filename ? req.file.filename: "";
        const path = req.file && req.file.path ? req.file.path: "";

        console.log(`field name is = to `, fieldname)

        const result = await orm.newPlayer(firstName, lastName, birthDate, email, street, city, province, postalCode, friendName, position, skill, fieldname, originalname, encoding, mimetype, destination, filename, path)

        console.log( `this is the result of of the router for await ormNewPlyaer`, result )
          
        // adding to playerList and pushing file details to JSON list
        playersList.push(newfullPlayerDetails)

        // writing player JSON list to a file
        fs.writeFileSync(savePlayers, JSON.stringify(playersList))


        
        registrationConfirmationEmail(email, firstName)

        res.redirect('/Available.html')

        
    }) 





    // delete, adjusted to account for photo upload by adding the upload.single
    app.delete('/api/player/delete/:id', async function(req, res){
        const playerid = req.params.id
        console.log(`[DELETE] id ${playerid}`)
        const deleteResults = await orm.deletePlayer(playerid)
        console.log(`...`, deleteResults)

        res.send({ status: true, message: 'Deleted successfully' })
    
    }) 



    // put, update player information
    app.post('/api/player/update',  upload.single('avatar'), async function(req, res){
        

        // this is a combined object which includes the photo details and the form post details
        const updatedPlayerData = req.body
          

        console.log(`[submit button pushed] Here is the id:`, req.body.playerid)

        console.log(`[submit button pushed] Here is the body`, updatedPlayerData)
        console.log(`this is the file details`, req.file)


        console.log( '[PUT] we received this data:', req.body )
        if( !req.body.playerid ) {
            res.status(404).send( { message: 'Invalid id' } )
        }
        const firstName = req.body.first_name;
        const lastName = req.body.last_name;
        const id = req.body.playerid
        const birthDate = req.body.birth_date;
        const email = req.body.email;
        const street = req.body.street;
        const city = req.body.city;
        const postalCode = req.body.postal_code;
        const province = req.body.province;
        const friendName = req.body.friend_name;
        const position = req.body.position;
        const skill = req.body.experience;
        const coach = req.body.coach;
        const fieldname =  req.file && req.file.fieldname ? req.file.fieldname : "";
        const originalname = req.file && req.file.originalname ? req.file.originalname: "";
        const encoding = req.file && req.file.encoding ? req.file.encoding: "";
        const mimetype = req.file && req.file.mimetype ? req.file.mimetype: "";
        const destination = req.file && req.file.destination ? req.file.destination : "";
        const filename = req.file && req.file.filename ? req.file.filename: "";
        const path = req.file && req.file.path ? req.file.path: "";

        console.log(`[update button pushed] Here is the combined object with forma and photo details`, firstName, lastName, birthDate, email, street, city, postalCode, province, friendName, position, skill, fieldname, originalname, encoding, mimetype, destination, filename, path, id)

        if (req.file === undefined){
            const saveResult = await orm.updatePlayer( id, firstName, lastName, birthDate, email, street, city, postalCode, province, friendName, position, skill, id )
            console.log(saveResult)
       
            res.redirect('/index.html')

        } else {
            const saveResult = await orm.updatePlayerwPhoto( id, firstName, lastName, birthDate, email, street, city, postalCode, province, friendName, position, skill, fieldname, originalname, encoding, mimetype, destination, filename, path, id )
            console.log(saveResult)
       
            res.redirect('/index.html')
            

        }





    }
    ) 






}

// send email confirmation following registration

function registrationConfirmationEmail(email, firstName){
    var mailOptions = {
        from: 'canadasgame@gmail.com',
        to: email,
        subject: 'Thank you for registering today',
        html: 
        `
        <body style="font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%; background-color: #f6f6f6; margin: 0; padding: 0;">
        <table border="0" cellpadding="0" cellspacing="0" class="body" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;" width="100%" bgcolor="#f6f6f6">
          <tr>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
            <td class="container" style="font-family: sans-serif; font-size: 14px; vertical-align: top; Margin: 0 auto !important; max-width: 580px; padding: 10px; width: 580px;" width="580" valign="top">
              <div class="content" style="box-sizing: border-box; display: block; Margin: 0 auto; max-width: 580px; padding: 10px;">
                <!-- START CENTERED WHITE CONTAINER -->
                <span class="preheader" style="color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;">This is preheader text. Some clients will show this text as a preview.</span>
                <!-- START HEADER -->
                <div class="header" style="margin-bottom: 20px; Margin-top: 10px; width: 100%;">
    
                </div>
                <!-- END HEADER -->
                <table border="0" cellpadding="0" cellspacing="0" class="main" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #fff; border-radius: 3px;" width="100%">
                  <tr>
                    <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">
                      <img src="https://www.kawarthalakes.ca/en/things-to-do/resources/Images/IMG_7219.jpg" alt="Ice Rink with one skater" width="562" class="img-responsive" style="border: none; -ms-interpolation-mode: bicubic; max-width: 100%;">
                    </td>
                  </tr>
                  <!-- START MAIN CONTENT AREA -->
                  <tr>
                    <td class="wrapper" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;" valign="top">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                        <tr>
    
                            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">
                                <h1 style="color: #222222; font-family: sans-serif; font-weight: 300; line-height: 1.4; margin: 0; Margin-bottom: 30px; font-size: 35px; text-align: center; text-transform: capitalize;">Welcome!!</h1>
                                <p style="font-family: sans-serif; font-size: 14px; font-weight: normal; Margin: 0; Margin-bottom: 15px;">Please be advised that we have received your registration information.  If you would like to review or update any of your information please visit the site, log in and click on the edit button for your profile to make an update.</p>
                                <p>For your records below is the information we received.</p>
                          
                                <p>Thank you</p>
                                <p>Canada's Game</p>
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <!-- END MAIN CONTENT AREA -->
                  <!-- START CALL OUT -->
                  <tr>
                    <td class="wrapper section-callout" style="font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px; background-color: #1abc9c; color: #ffffff;" valign="top" bgcolor="#1abc9c">
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;" width="100%">
                        <tr>
                          <td class="align-center" style="font-family: sans-serif; font-size: 14px; vertical-align: top; text-align: center; color: #ffffff;" valign="top" align="center">
                            Great to have you on board ${firstName}  :-)
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                  <!-- END CALL OUT -->
                </table>
                <!-- END CENTERED WHITE CONTAINER -->
              </div>
            </td>
            <td style="font-family: sans-serif; font-size: 14px; vertical-align: top;" valign="top">&nbsp;</td>
          </tr>
            </table>
        </body>
        `
        };
        
        transporter.sendMail(mailOptions, function(error, info){
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
        });

}

module.exports = router

