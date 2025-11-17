let mockData = {};

  async function loadMockJson() {
    if (Object.keys(mockData).length > 0) return;
    // Try to fetch the mock JSON file
    try {
      const response = await fetch('assets/packages/tawakkalna_sdk_flutter/assets/mock_profile1.0.2.json');
      if (!response.ok) {
        console.error('Failed to fetch mock_profile1.0.2.json:', response.status, response.statusText);
        return;
      }
      const text = await response.text();
      if (!text || text.trim().length === 0) {
        console.error('mock_profile1.0.2.json is empty');
        return;
      }
      const json = JSON.parse(text);
      for (const endpoint of json.mock_endpoints) {
        mockData[endpoint.path] = endpoint.return;
      }
      console.log('Successfully loaded mock data with', Object.keys(mockData).length, 'endpoints');
    } catch (e) {
      console.error('Failed to load mock_profile1.0.2.json', e);
    }
  }

  function getMock(path) {
    return mockData[path] ?? {};
  }

  function alertAndReturn(name, value) {
    alert(name);
    return value;
  }

  async function generateTokenJs() {
    await loadMockJson();
    return alertAndReturn('generateTokenJs', getMock('/v2/authenticate/generatetoken'));
  }

  async function getUserFullNameJs() {
    await loadMockJson();
    return alertAndReturn('getUserFullNameJs', getMock('/v2/user_data/full_name'));
  }

  async function getUserFamilyMembersJs(minage, maxage, gender) {
    await loadMockJson();
    return alertAndReturn('getUserFamilyMembersJs', getMock('/v2/user_data/family_members'));
  }

  async function getUserSponsorsJs(minage, maxage, gender) {
    await loadMockJson();
    return alertAndReturn('getUserSponsorsJs', getMock('/v2/user_data/sponsors'));
  }

  async function getUserNationalityJs() {
    await loadMockJson();
    return alertAndReturn('getUserNationalityJs', getMock('/v2/user_data/nationality_name'));
  }
