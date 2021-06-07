const db = require('./connection')('hockey_db','root')





function newPlayer(firstName, lastName, birthDate, email, street, city, province, postalCode, friendName, position, skill, fieldname, originalname, encoding, mimetype, destination, filename, path){
    const sql = `INSERT INTO player (first_name, last_name, birth_date, email, street, city, province, postal_code, friend_first_name, position, experience_level, fieldname, originalname, encoding, mimetype, destination, filename, path) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)`
    
    console.log(`about to save: `, sql)
    
    return db.query(sql, [firstName, lastName, birthDate, email, street, city, province, postalCode, friendName, position, skill, fieldname, originalname, encoding, mimetype, destination, filename, path])


}


function updatePlayer(id, first_name, last_name, birth_date, email, street, city, postal_code, province, friend_first_name, position, experience){
    const sql = `UPDATE player SET first_name = ?, last_name = ?, birth_date = ?, email = ?, street = ?, city = ?, postal_code = ?, province = ?, friend_first_name = ?, position = ?, experience_level = ? WHERE id = ?`
    return db.query( sql, [ first_name, last_name, birth_date, email, street, city, postal_code, province, friend_first_name, position, experience, id ] )
}

function updatePlayerwPhoto(id, first_name, last_name, birth_date, email, street, city, postal_code, province, friend_first_name, position, experience, fieldname, originalname, encoding, mimetype, destination, filename, path,){
    const sql = `UPDATE player SET first_name = ?, last_name = ?, birth_date = ?, email = ?, street = ?, city = ?, postal_code = ?, province = ?, friend_first_name = ?, position = ?, experience_level = ?,  fieldname = ?, originalname = ?, encoding = ?, mimetype = ?, destination = ?, filename = ?, path=? WHERE id = ?`
    return db.query( sql, [ first_name, last_name, birth_date, email, street, city, postal_code, province, friend_first_name, position, experience, fieldname, originalname, encoding, mimetype, destination, filename, path, id ] )
}





function deletePlayer( id ){
    console.log(`ormid`,id)
    return db.query( 'DELETE FROM player WHERE id=?', [ id ] )
}


// grab by team
function getTeam(Larry){
    return db.query(`SELECT player.id, player.first_name, player.last_name, player.position, player.filename, team.name
    FROM player LEFT JOIN team ON player.coach_id = team.id
    WHERE team.name = "${Larry}";` )

}


// get one player information
 async function getPlayer(player){
    console.log(`orm get player id`, player)
    const sql = `SELECT * FROM player WHERE id = ${player};`
    let a = await db.query(`SELECT * FROM player WHERE id = ${player};`) 
    console.log(a)
    return a
    
}

// grab by team
function getAvailable(){
  return db.query('SELECT id, first_name, last_name, position, filename FROM player WHERE coach_id IS NULL;')
}



module.exports = {newPlayer, deletePlayer, getTeam, getPlayer, getAvailable, updatePlayer, updatePlayerwPhoto}




