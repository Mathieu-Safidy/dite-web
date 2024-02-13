<?php 
  include "../inc/fonction.php";
?>
<form action="../inc/traitement.php" name="form">
<input type="hidden" name="tabName" value="the">
                      <div class="col-md-12 mb-3">
                        <!-- nom -->
                        <div class="input-group mb-3">
                            <div class="form-floating">
                              <input type="text" class="form-control" id="floatingName" placeholder="Nom" name="nom">
                              <label for="floatingName">Nom</label>
                            </div>
                          </div>
                          <div class="input-group mb-3">
                            <!-- nom variable -->
                              <select class="form-select" aria-label="Default select example" name="idVar">
                                <option selected="">Variete</option>
                            <?php 
                                  $table = getTable("v_variete");
                                  for($i = 0; $i < count($table); $i++) {
                              ?>
                              <option value="<?php echo($table[$i]['idVar']) ?>"><?php echo($table[$i]['nom']) ?></option>
                                  <?php } ?>
                            </select>

                          </div>
                          <!-- occupation -->
                          <div class="input-group mb-3">
                            <input type="text" class="form-control" placeholder="Occupation" aria-label="Occupation" aria-describedby="basic-addon2" name="occupation">
                            <span class="input-group-text" id="basic-addon2">pied</span>
                          </div>
                          <!-- rendement -->
                          <div class="input group mb-3">
                            <div class="form-floating">

                              <input type="text" class="form-control" id="floatingName" placeholder="rendement" name="rendement">
                              <label for="floatingName">Rendement</label>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="text-center">
                          <button type="submit" class="btn btn-primary">Valider</button>
                          <button type="reset" class="btn btn-primary">Reset</button>
                      </div>
</form>