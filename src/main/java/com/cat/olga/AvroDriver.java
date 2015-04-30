package com.cat.olga;

import com.cat.olga.models.User;
import org.apache.avro.mapreduce.AvroJob;
import org.apache.avro.mapreduce.AvroKeyInputFormat;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.conf.Configured;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;
import org.apache.hadoop.util.Tool;
import org.apache.hadoop.util.ToolRunner;

import static java.lang.System.getProperty;

/**
 * Hello world!
 *
 */
public class AvroDriver extends Configured implements Tool
{
    public static void main( String[] args ) throws Exception {
      int exitCode = ToolRunner.run(new Configuration(), new AvroDriver(), args);
      System.exit(exitCode);
    }

  @Override
  public int run(String[] args) throws Exception {
    Configuration configuration = getConf();

    Job job = Job.getInstance(configuration, this.getClass().getSimpleName());
    job.setJarByClass(this.getClass());

    String inputDir = getProperty("inputPath");
    String outputDir = getProperty("outputPath");

    job.setJarByClass(AvroDriver.class);
    job.setJobName("Color count");
    FileInputFormat.addInputPath(job, new Path(inputDir));
    FileOutputFormat.setOutputPath(job, new Path(outputDir));

    job.setInputFormatClass(AvroKeyInputFormat.class);
    job.setMapperClass(ColorCountMapper.class);
    AvroJob.setInputKeySchema(job, User.getClassSchema());
    job.setMapOutputKeyClass(Text.class);
    job.setMapOutputValueClass(IntWritable.class);

    job.setNumReduceTasks(0);
//
//    job.setOutputFormatClass(AvroKeyValueOutputFormat.class);
//    job.setReducerClass(ColorCountReducer.class);
//    AvroJob.setOutputKeySchema(job, Schema.create(Schema.Type.STRING));
//    AvroJob.setOutputValueSchema(job,Schema.create(Schema.Type.INT));

    return job.waitForCompletion(true) ? 0 : 1;
  }
}
