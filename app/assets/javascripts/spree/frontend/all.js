function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var baseUrl = "/user/pages/images/flags";
  var $state = $(
    '<span style="'+ state.text +'"> ' + state.text + '</span>'
  );
  return $state;
};

$("#color-variant").select2({
  templateResult: formatState
});
