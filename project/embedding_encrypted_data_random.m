
function re=embedding_encrypted_data_random(sd,r,z)

for ji=1:5
	 r(ji,ji)=z(ji);
end


for ji=sd:-1:(sd-5)
	 r(ji,ji)=z(ji);
end

sdn=floor(sd/2);

for k=sdn:-1:(sdn-5)
	 r(k,k)=z(k);
end


for k=sdn:1:(sdn+5)
	 r(k,k)=z(k);
end


sdm=floor(sd/5);
for ki=sdm:-1:(sdm-5)
	 r(ki,ki)=z(ki);
end


for ki=sdm:1:(sdm+5)
	 r(ki,ki)=z(ki);
end

re=r;