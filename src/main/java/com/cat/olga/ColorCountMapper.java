package com.cat.olga;

import com.cat.olga.models.User;
import org.apache.avro.mapred.AvroKey;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.NullWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

public class ColorCountMapper extends Mapper<AvroKey<User>, NullWritable, Text, IntWritable> {
  @Override
  public void map(AvroKey<User> user, NullWritable value, Context context) throws IOException, InterruptedException {
    CharSequence color = user.datum().getFavoriteColor();
    if (color == null) {
      color = "none";
    }
    context.write(new Text(color.toString()), new IntWritable(1));
  }
}