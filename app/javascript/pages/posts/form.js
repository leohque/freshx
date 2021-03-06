  const grow_selector = document.getElementById("post_grow_id")

  if (grow_selector) {
    grow_selector.addEventListener("change", (event) => {
      const grow_id = grow_selector.value;

      if (document.querySelector('.post_plant')) {
        document.querySelector('.post_plant').remove();
      }
      if (grow_id != "") {
        Rails.ajax({
          url: `/grows/${grow_id}/plants`,
          type: "GET",
          success: function(data) {
            console.log(data.plants);
            if (data.plants[0]) {
              if (document.querySelector('.post_plant')) {
                document.querySelector('.post_plant').remove();
              }

              newElement = '<div class="form-group select optional post_plant">';
              newElement += '<label class="select optional" for="post_plant_id">Tag a Plant</label>'
              newElement += '<select class="form-control select optional" name="post[plant_id]" id="post_plant_id">';
              newElement += '<option value=""></option>';

              data.plants.forEach((plant) => {
                newElement += `<option value="${plant.id}">${plant.name}</option>`
              });

              newElement += '</select></div>';

              document.getElementById("place-for-plants-select").insertAdjacentHTML("beforeend", newElement);
            }
          }
        });
      }

    });
  }
