// 'describe' digunakan untuk mengelompokkan tes-tes yang berhubungan.
describe('Sample Test Suite', () => {
  // 'it' atau 'test' mendefinisikan sebuah kasus uji individual.
  it('should verify that true is indeed true', () => {
    // 'expect' adalah fungsi yang digunakan untuk membuat 'assertion' atau pernyataan.
    // '.toBe()' adalah 'matcher' yang memeriksa kesetaraan yang ketat (===).
    expect(true).toBe(true);
  });
});
