Return-Path: <SRS0=EE8D=UB=guillain.net=jean-christophe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38921E77197
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jan 2025 15:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA0D1C4CED3; Thu,  9 Jan 2025 15:16:48 +0000 (UTC)
Received: from 3.mo533.mail-out.ovh.net (3.mo533.mail-out.ovh.net [46.105.35.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 111ACC4CED2
	for <linux-firmware@kernel.org>; Thu,  9 Jan 2025 15:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 111ACC4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=guillain.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=guillain.net
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4YTT026fF7z1XSf;
	Thu,  9 Jan 2025 15:16:34 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <maxim.cournoyer@gmail.com>; Thu,  9 Jan 2025 15:16:34 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.109.140.86])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4YTT0263WMzyH2;
	Thu,  9 Jan 2025 15:16:34 +0000 (UTC)
Received: from guillain.net (unknown [10.1.6.0])
	by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 4FFEE3A3619;
	Thu,  9 Jan 2025 15:16:34 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-112S0068689fea6-7479-4499-ad38-06d3f9948650,
                    65DEFE318BE0D9D2BD8A103BFE5152648EDA3E4B) smtp.auth=jean-christophe@guillain.net
X-OVh-ClientIp:37.170.19.26
Message-ID: <bbd0b116ab4fc8d564ac7e44305f9546f7bebbe2.camel@guillain.net>
Subject: Re: [linux-firmware][bug] "make deb" generates an error on Debian :
 "./copy-firmware.sh: 116: cannot create : Directory nonexistent"
From: Jean-Christophe Guillain <jean-christophe@guillain.net>
To: maxim.cournoyer@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Thu, 09 Jan 2025 16:16:32 +0100
In-Reply-To: <9efd447b0866dc765a5b1e90318d25a4e3ddddbd.camel@guillain.net>
References: <9efd447b0866dc765a5b1e90318d25a4e3ddddbd.camel@guillain.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16740442766789152600
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredttderjeenucfhrhhomheplfgvrghnqdevhhhrihhsthhophhhvgcuifhuihhllhgrihhnuceojhgvrghnqdgthhhrihhsthhophhhvgesghhuihhllhgrihhnrdhnvghtqeenucggtffrrghtthgvrhhnpeejkedvueekgefggeeltedtudehveehgefhieekveffleekffeuheekieelgeelheenucfkphepuddvjedrtddrtddruddpfeejrddujedtrdduledrvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjvggrnhdqtghhrhhishhtohhphhgvsehguhhilhhlrghinhdrnhgvthdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmrgigihhmrdgtohhurhhnohihvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheeffegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=TDTAdita/DCwD+Cfat+3l4j1w2ty/zYirOqRuGRofL0=;
 c=relaxed/relaxed; d=guillain.net; h=From; s=ovhmo31693-selector1;
 t=1736435795; v=1;
 b=fZd0OSUY6K4P9gNa9HpSfGEQ91RTwiOVaeQh1luVxMBljzI7+bvhedM7MX1Ve/ymTjKAP1sT
 58zFVCSO+Djy+0HEtVKg6x4FKKBS7cvBQTipnY9zQ9Pct6lpqRW/b6FpvpXMBlvK14mq+mi5FgJ
 3yWjOmogAwNN7BpYlTzjJKqtX4Ukd8nkIqrQQHjTzX8WFX1y4PRjRurf1fyQM+riEkHiinwotQj
 fM0rAOXCWBoGNl90VsFNq//gmceT6ppKIz2K/bJU2WU8mzldH2ktpPQxZsX6zLAUScsjZe9qRqG
 gHvQQlB9VSLQi1agQde2gP++ot+vLXDvDfSIyEiYAfVqw==

On Thu, 2025-01-09 at 16:04 +0100, Jean-Christophe Guillain wrote:
> Hello,
>=20
> I encounter this error when trying to build a deb package of the
> linux-
> firmware repo :
>=20
> jc@dingdong:~/kernel/linux-firmware$ make deb
> ./build_packages.py --deb
> ./copy-firmware.sh: 116: cannot create : Directory nonexistent
> =C2=A0dpkg-source --before-build .
> =C2=A0debian/rules clean
> =C2=A0debian/rules binary
> =C2=A0dpkg-genbuildinfo --build=3Dbinary -O../linux-firmware-
> upstream_20241210-34-gc0f414a6_amd64.buildinfo
> =C2=A0dpkg-genchanges --build=3Dbinary -O../linux-firmware-
> upstream_20241210-
> 34-gc0f414a6_amd64.changes
> =C2=A0dpkg-source --after-build .
> Built package: dist/linux-firmware-upstream_20241210-34-
> gc0f414a6_all.deb
>=20

I think that $parallel_args_file on line 116 is just never defined in
my case...

> I bisected it to the commit :
> [2b781910a7d0a7fd67e3d4f40fd8178004c588bc] Add support to install
> files/symlinks in parallel.
>=20
> Tell me if I can help.
>=20
> Cheers,
> jC
>=20
>=20

