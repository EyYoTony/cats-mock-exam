const mysql = require('mysql')
const HTTPError = require('node-http-error')
const dalHelper = require('./lib/dal-helper')
const { assoc, prop, compose, omit } = require('ramda')

//////////////////////
//      CATS
//////////////////////
const addCat = (cat, callback) => {
  dalHelper.create('cat', cat, prepSQLCreate, callback)
}
const getCat = (catId, callback) => {
  dalHelper.read('cat', 'ID', catId, c => c, callback)
}
const updateCat = (cat, id, callback) => {
  dalHelper.update('cat', 'ID', prepSQLUpdate(cat), id, callback)
}
const deleteCat = (catId, callback) => {
  dalHelper.deleteRow('cat', 'ID', catId, callback)
}
const listCats = (lastItem, filter, limit, callback) => {
  dalHelper.queryDB(
    'cat',
    lastItem,
    filter,
    limit,
    formatSQLtoCouch,
    'ID',
    callback
  )
}
//(tableName, lastItem, filter, limit, formatter, orderColumn, callback)

//////////////////////
//     BREEDS
//////////////////////
const addBreed = (breed, callback) => {
  dalHelper.create('breed', breed, prepSQLCreate, callback)
}
const getBreed = (breedId, callback) => {
  dalHelper.read('breed', 'ID', breedId, b => b, callback)
}
const updateBreed = (breed, id, callback) => {
  dalHelper.update('breed', 'ID', prepSQLUpdate(breed), id, callback)
}
const deleteBreed = (breedId, callback) => {
  dalHelper.deleteRow('breed', 'ID', breedId, callback)
}
const listBreeds = (lastItem, filter, limit, callback) => {
  dalHelper.queryDB(
    'breed',
    lastItem,
    filter,
    limit,
    formatSQLtoCouch,
    'ID',
    callback
  )
}

const prepSQLCreate = data => omit('type', data)
const prepSQLUpdate = data =>
  compose(omit('_id'), assoc('ID', data['_id']), omit('_rev'), omit('type'))(
    data
  )
const formatSQLtoCouch = type => data =>
  compose(
    omit('ID'),
    assoc('_id', data['ID']),
    assoc('_rev', null),
    assoc('type', type)
  )(data)

const dal = {
  addCat,
  listCats,
  getCat,
  deleteCat,
  updateCat,
  addBreed,
  getBreed,
  updateBreed,
  deleteBreed,
  listBreeds
}

module.exports = dal
