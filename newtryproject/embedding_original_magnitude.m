function decrypt=embedding_original_magnitude(sd,r,org)



for ji=1:sd
	 r(ji,ji)=org(ji);
end

decrypt=r;