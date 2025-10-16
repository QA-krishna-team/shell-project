#!/bin/bash

# Read number of rows
echo -n "Enter number of rows: "
read n

num=1

# Outer loop for rows
for ((i=1; i<=n; i++))
do
  # Inner loop for numbers in each row
  for ((j=1; j<=i; j++))
  do
    echo -n "$num "
    ((num++))
  done




 #!/bin/bash

# Read number of rows
echo -n "Enter number of rows: "
read n

num=1

# Outer loop for rows
for ((i=1; i<=n; i++))
do
  # Inner loop for numbers in each row
  for ((j=1; j<=i; j++))
  do
    echo -n "$num "
    ((num++))
  done
  echo ""  # move to next line
done
#!/bin/bash

# Read number of rows
echo -n "Enter number of rows: "
read n

num=1

# Outer loop for rows
for ((i=1; i<=n; i++))
do
  # Inner loop for numbers in each row
  for ((j=1; j<=i; j++))
  do
    echo -n "$num "
    ((num++))
  done
  echo ""  # move to next line
done
 

