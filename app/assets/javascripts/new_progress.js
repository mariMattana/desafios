// $('#new-progress-form').submit(function(e){
//   e.preventDefault();

//   let progressItem = $(this).serialize();

//   $.post('', progressItem, function(data){
//     $
//   })
// })

//     <% @progresses.each do |progress| %>
//       <div class="card card-progress" id="new-progress-form">
//         <h3><%= progress.title %></h3>
//         <div class="progress-img">
//           <%= cl_image_tag(progress.user.photo, width: 60, height: 60, crop: :fill) %>
//         </div>
//         <p><%= progress.user.first_name + " " + progress.user.last_name %></p>
//         <p><%= progress.description %></p>
//         <p>Postado em <%= progress.date %></p>
//       </div>
//     <% end %>
