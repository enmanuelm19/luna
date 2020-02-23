function formatState (state) {
  if (!state.id) {
    return state.text;
  }
  var $state = $(
    '<span style="'+ state.text +'"> ' + state.text + '</span>'
  );
  return $state;
};

var selectColor = document.getElementById('color-variant')

if (selectColor) {
 selectColor.select2({
  templateResult: formatState
 });
}
