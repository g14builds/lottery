async function main(){
    const Lottery = await ethers.getContractFactory("Lottery");
    const lottery = await Lottery.deploy();

    console.log("Lottery deployed to ", inbox14.address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });