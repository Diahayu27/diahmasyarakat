<div id="layoutSidenav">
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h2 class="mt-4" style="text-transform:uppercase">Input Pengaduan</h2>
                <br>
                <form method="post" action="<?= base_url('User/tambahmengadu') ?>" enctype="multipart/form-data">
                    <fieldset disabled>
                        <div class="mb-3">
                            <label for="disabledTextInput" class="form-label">NIK</label>
                            <input type="text" name="nik" class="form-control" id="nik" aria-describedby="nik"
                                placeholder="<?= $user['nik']?>">
                        </div>
                    </fieldset>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Pilih Kategori</label>
                        <select class="form-select form-control" aria-label="Default select example" name="kategori"
                            id="kategori">
                            <option selected>- Pilih Kategori -</option>
                            <option value="1">Prasarana Umum</option>
                            <option value="2">Lingkungan Hidup</option>
                            <option value="3">Perhubungan</option>
                            <option value="4">Kesehatan</option>
                            <option value="5">Pelanggaran Peraturan Daerah</option>
                            <option value="6">Perizinan</option>
                            <option value="7">Sosial</option>
                            <option value="8">Perpajakan</option>
                            <option value="9">Komunikasi dan Informatika</option>
                            <option value="10">Kepegawaian</option>
                            <option value="11">Pelayanan Kecamatan Kelurahan</option>
                            <?php foreach ($kategori as $kt) : ?>
                            <option value=" <?= $kt['id'] ?>">
                                <?= $kt['kategori'] ?></option>
                            <?php endforeach; ?>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Pilih Subkategori</label>
                        <select class="form-select form-control" aria-label="Default select example" name="subkategori"
                            id="subkategori">
                            <option selected>- Pilih Subkategori -</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputEmail1" class="form-label">Isi Laporan Pengaduan</label>
                        <textarea class="form-control" name="laporan" id="laporan"
                            placeholder="Masukan Laporan"></textarea>
                    </div>

                    <div class="mb-3">
                        <label for="exampleInputPassword1" class="form-label">Foto</label>
                        <input type="file" class="form form-control" name="image">
                    </div>

                    <button type="submit" class="btn btn-primary">Simpan</button>
                </form>
            </div>
        </main>
    </div>
</div>
</div>