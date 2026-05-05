export function formatDate(d: Date): string {
  const day = d.getUTCDate();
  const suffix =
    day === 1 || day === 21 || day === 31
      ? "st"
      : day === 2 || day === 22
        ? "nd"
        : day === 3 || day === 23
          ? "rd"
          : "th";
  const month = d.toLocaleDateString("en-GB", {
    month: "long",
    timeZone: "UTC",
  });
  return `${day}${suffix} ${month} ${d.getUTCFullYear()}`;
}
