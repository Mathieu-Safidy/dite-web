<?php include("../inc/fonction.php") ?>
<form action="../inc/traitement.php" name="form">
                      <input type="hidden" name="tabName" value="parcelle">
                      <div class="col-md-12 mb-3">
                        <div class="input-group mb-3">
                          <input type="number" class="form-control" placeholder="Surface" aria-label="Surface" aria-describedby="basic-addon2" name="surface">
                          <span class="input-group-text" id="basic-addon2">ha</span>
                        </div>
                          <div class="input-group mb-3">
                            
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
                          
                          
                          
                        </div>
                      </div>
                      <div class="text-center">
                          <button type="submit" class="btn btn-primary">Valider</button>
                          <button type="reset" class="btn btn-primary">Reset</button>
                      </div>
</form>