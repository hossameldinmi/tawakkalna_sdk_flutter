// Auto-generated wrappers for window.TWK.V2 (sorted as in twkhelper.js)
// Each function calls the corresponding V2 API and returns JSON.stringify(response.result, null, 2)

async function generateTokenJs() {
  var response = await window.TWK.V2.generateToken();
  return JSON.stringify(response.result, null, 2);
}

async function getUserFullNameJs() {
  var response = await window.TWK.V2.getUserFullName();
  return JSON.stringify(response.result, null, 2);
}

async function getUserFamilyMembersJs(minage, maxage, gender) {
  var response = await window.TWK.V2.getUserFamilyMembers(minage, maxage, gender);
  return JSON.stringify(response.result, null, 2);
}

async function getUserSponsorsJs(minage, maxage, gender) {
  var response = await window.TWK.V2.getUserSponsors(minage, maxage, gender);
  return JSON.stringify(response.result, null, 2);
}

async function getUserNationalityJs() {
  var response = await window.TWK.V2.getUserNationality();
  return JSON.stringify(response.result, null, 2);
}

// Optional: export for module usage (uncomment if needed)
// export { generateTokenJs, getUserFullNameJs, getUserFamilyMembersJs, getUserSponsorsJs, getUserNationalityJs };
