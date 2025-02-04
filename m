Return-Path: <SRS0=qMqL=U3=guillain.net=jean-christophe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB993C02197
	for <linux-firmware@archiver.kernel.org>; Tue,  4 Feb 2025 11:03:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8B81DC4CEE2; Tue,  4 Feb 2025 11:03:39 +0000 (UTC)
Received: from smtpout3.mo534.mail-out.ovh.net (smtpout3.mo534.mail-out.ovh.net [51.210.94.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0EA5FC4CEDF
	for <linux-firmware@kernel.org>; Tue,  4 Feb 2025 11:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0EA5FC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=guillain.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=guillain.net
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [51.68.80.175])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4YnL7x1Wctz1Zc9;
	Tue,  4 Feb 2025 11:03:25 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <maxim.cournoyer@gmail.com>; Tue,  4 Feb 2025 11:03:24 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.140.114])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4YnL7w6XLbzHqBt;
	Tue,  4 Feb 2025 11:03:24 +0000 (UTC)
Received: from guillain.net (unknown [10.1.6.3])
	by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 0EE7F3A3616;
	Tue,  4 Feb 2025 11:03:23 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-102R004d51e7628-b3ef-4a75-9ccb-ef251f6eb4ba,
                    70124334DE1DD460E9A14375A0C5930E27FF0D3F) smtp.auth=jean-christophe@guillain.net
X-OVh-ClientIp:78.243.13.89
Message-ID: <cfb4f859659eda370d3bc3f7af3ce9cb17fdfc39.camel@guillain.net>
Subject: Re: [linux-firmware][bug] "make deb" generates an error on Debian :
 "./copy-firmware.sh: 116: cannot create : Directory nonexistent"
From: Jean-Christophe Guillain <jean-christophe@guillain.net>
To: Maxim Cournoyer <maxim.cournoyer@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Tue, 04 Feb 2025 12:03:22 +0100
In-Reply-To: <87v7tqbjup.fsf@gmail.com>
References: <9efd447b0866dc765a5b1e90318d25a4e3ddddbd.camel@guillain.net>
	 <bbd0b116ab4fc8d564ac7e44305f9546f7bebbe2.camel@guillain.net>
	 <87v7tqbjup.fsf@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17580927048092913496
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomheplfgvrghnqdevhhhrihhsthhophhhvgcuifhuihhllhgrihhnuceojhgvrghnqdgthhhrihhsthhophhhvgesghhuihhllhgrihhnrdhnvghtqeenucggtffrrghtthgvrhhnpeehledtueeileeuueeuhffgudefjeetieevueduhfffvdetleeludfftdeuhfffheenucffohhmrghinhepghhithhlrggsrdgtohhmnecukfhppeduvdejrddtrddtrddupdejkedrvdegfedrudefrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepjhgvrghnqdgthhhrihhsthhophhhvgesghhuihhllhgrihhnrdhnvghtpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhgrgihimhdrtghouhhrnhhohigvrhesghhmrghilhdrtghomhdprhgtphhtthhopehlihhnuhigqdhfihhrmhifrghrvgeskhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehfeegmgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=kj4Rjgcz+N/gxHLnA722Flki9hoVyOR5QGxyT9t/WdU=;
 c=relaxed/relaxed; d=guillain.net; h=From; s=ovhmo31693-selector1;
 t=1738667005; v=1;
 b=gn14L5Es42yvoPdbYwUzCF3sDzwKsg66mPFY+7tFNKDfqOopogLzRKUdHb3aEE32/5y3YtfX
 On8vqbBtxECPysk6XL7RlmIdiwypX06r03MybbOsFZ1f1kOYU5Mbw0rG/6wFtziV2rsHB/LiSaM
 lHv0u4SXNWZQtUnwPikKPGB0Qkb5nww1Mjc+DMv2i+7/rfZe8ZTgqVePeTDtkeBqLTRjqWkblso
 b8rTddLdweEV0IWAQVdKkLB6DOFOQBcVCfiSN643pPLG+olwMU7jfQ/oOUhEP5xvS+2DMLbKu/S
 KvMz6xH9zJ6Ozw4UTVav8UavUxXwUE7j4bSEp8bqtcJCA==

Hi Maxim,

I just tested your patch. It fixes the error message for me.

Thank you very much,
Jean-Christophe Guillain


On Tue, 2025-02-04 at 10:05 +0900, Maxim Cournoyer wrote:
> Hi Jean-Christophe,
>=20
> Jean-Christophe Guillain <jean-christophe@guillain.net> writes:
>=20
> > On Thu, 2025-01-09 at 16:04 +0100, Jean-Christophe Guillain wrote:
> > > Hello,
> > >=20
> > > I encounter this error when trying to build a deb package of the
> > > linux-
> > > firmware repo :
> > >=20
> > > jc@dingdong:~/kernel/linux-firmware$ make deb
> > > ./build_packages.py --deb
> > > ./copy-firmware.sh: 116: cannot create : Directory nonexistent
> > > =C2=A0dpkg-source --before-build .
> > > =C2=A0debian/rules clean
> > > =C2=A0debian/rules binary
> > > =C2=A0dpkg-genbuildinfo --build=3Dbinary -O../linux-firmware-
> > > upstream_20241210-34-gc0f414a6_amd64.buildinfo
> > > =C2=A0dpkg-genchanges --build=3Dbinary -O../linux-firmware-
> > > upstream_20241210-
> > > 34-gc0f414a6_amd64.changes
> > > =C2=A0dpkg-source --after-build .
> > > Built package: dist/linux-firmware-upstream_20241210-34-
> > > gc0f414a6_all.deb
> > >=20
> >=20
> > I think that $parallel_args_file on line 116 is just never defined
> > in
> > my case...
> >=20
> > > I bisected it to the commit :
> > > [2b781910a7d0a7fd67e3d4f40fd8178004c588bc] Add support to install
> > > files/symlinks in parallel.
>=20
> Indeed, I could reproduce with the 'deb' target.=C2=A0 I had missed that
> issue with the other targets as they invoke the copy-firmware. script
> always with the -j argument (-j1 when not using parallel
> compression),
> which was hiding this issue.
>=20
> I've now sent a MR to fix that [0]; thank you for reporting it!
>=20
> [0]=C2=A0
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/436
>=20

