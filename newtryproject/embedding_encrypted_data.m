
function re=embedding_encrypted_data(sd,r,z)



for ji=1:sd
	 r(ji,ji)=z(ji);
end

re=r;