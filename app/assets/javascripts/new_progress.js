function displayProgressForm() {
  document.getElementById("progress-form").classList.toggle("hidden");
  // openProgressForm = document.getElementById("open-form-progress");
  // if (openProgressForm.style.top === "4%") {
  //   openProgressForm.style.top = "6%";
  // } else {
  //   openProgressForm.style.top = "4%";
  // }
}

// $('#progress-form').submit(function(e){
//   e.preventDefault();

//   let progressItem = $(this).serialize();

//   $.post('/challenge/:id/show', progressItem, function(data){
//     $('new-progress').append(
//       `
//       <h3>${data.title}</h3>
//       <div class="progress-img">
//         <%= cl_image_tag(progress.user.photo, width: 60, height: 60, crop: :fill) %>
//       </div>
//       <p>${data.user.first_name} + " " + ${data.user.last_name}</p>
//       <p>${data.description}</p>
//       <p>Postado em ${data.date}</p>
//       `
//       )
//   })
// })
