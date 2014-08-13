
function re=embedding_encrypted_data_mix_five(sd,r,z)

for ji=1:5
	 r(ji,ji)=z(ji);
end


for ji=sd:-1:(sd-5)
	 r(ji,ji)=z(ji);
end

re=r;