
function re=embedding_encrypted_data_new_last_five(sd,r,z)



for ji=sd:-1:(sd-5)
	 r(ji,ji)=z(ji);
end

re=r;