import { prisma } from "./prisma.js";

await prisma.paymentRecord.upsert({
  where: { externalId: "demo-regenloop-market" },
  update: {},
  create: {
    externalId: "demo-regenloop-market",
    owner: "GDEMO",
    target: 1000000,
    status: "seeded",
    projectName: "RegenLoop Market",
  },
});

console.log("Seeded RegenLoop Market");
await prisma.$disconnect();
