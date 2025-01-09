Return-Path: <SRS0=EE8D=UB=guillain.net=jean-christophe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9773E77197
	for <linux-firmware@archiver.kernel.org>; Thu,  9 Jan 2025 15:05:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E0F8C4CED6; Thu,  9 Jan 2025 15:05:16 +0000 (UTC)
Received: from 4.mo534.mail-out.ovh.net (4.mo534.mail-out.ovh.net [188.165.54.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30A22C4CED2
	for <linux-firmware@kernel.org>; Thu,  9 Jan 2025 15:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30A22C4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=guillain.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=guillain.net
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo534.mail-out.ovh.net (Postfix) with ESMTPS id 4YTSkj6n1Sz1gmR;
	Thu,  9 Jan 2025 15:05:01 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <maxim.cournoyer@gmail.com>; Thu,  9 Jan 2025 15:05:01 +0000 (UTC)
Received: from mta6.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.188.202])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4YTSkj5tfwzyHR;
	Thu,  9 Jan 2025 15:05:01 +0000 (UTC)
Received: from guillain.net (unknown [10.1.6.7])
	by mta6.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id CCFD4D42DE2;
	Thu,  9 Jan 2025 15:05:00 +0000 (UTC)
Authentication-Results:garm.ovh; auth=pass (GARM-114S00806108510-d899-4913-b620-a748ca6d7c27,
                    65DEFE318BE0D9D2BD8A103BFE5152648EDA3E4B) smtp.auth=jean-christophe@guillain.net
X-OVh-ClientIp:37.170.19.26
Message-ID: <9efd447b0866dc765a5b1e90318d25a4e3ddddbd.camel@guillain.net>
Subject: [linux-firmware][bug] "make deb" generates an error on Debian :
 "./copy-firmware.sh: 116: cannot create : Directory nonexistent"
From: Jean-Christophe Guillain <jean-christophe@guillain.net>
To: maxim.cournoyer@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org
Date: Thu, 09 Jan 2025 16:04:59 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16545380606916661080
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefuddrudegiedgieelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkuffhvfevffgtgfgfggesthhqredttderjeenucfhrhhomheplfgvrghnqdevhhhrihhsthhophhhvgcuifhuihhllhgrihhnuceojhgvrghnqdgthhhrihhsthhophhhvgesghhuihhllhgrihhnrdhnvghtqeenucggtffrrghtthgvrhhnpeduhfdtfeduleejhffgiedvjeeigfefieevjeeiteeiteehveefieehkeduudejkeenucfkphepuddvjedrtddrtddruddpfeejrddujedtrdduledrvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpehjvggrnhdqtghhrhhishhtohhphhgvsehguhhilhhlrghinhdrnhgvthdpnhgspghrtghpthhtohepvddprhgtphhtthhopehmrgigihhmrdgtohhurhhnohihvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqfhhirhhmfigrrhgvsehkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheefgegmpdhmohguvgepshhmthhpohhuth
DKIM-Signature: a=rsa-sha256; bh=0NsDofEChfLnMB1TF3fSBXp2dknS3Vj8rajMxWFC6Bc=;
 c=relaxed/relaxed; d=guillain.net; h=From; s=ovhmo31693-selector1;
 t=1736435102; v=1;
 b=XLJnqLMbmu9Iz+ZhqKGYNKXiWratye9nYA4DS2fxL6Pu7L1qGmOMlT29ThhCdadB2kS9teVX
 tRVfinusFKAXKSwImh/Da4nKC4CgzDucXxMlRSni/pSqr5vF8aP3K/g+YLuVbuUg40nj1vb9+65
 lje6zov4/AkwF/cWmn8XGoN7g9MsV7oM4Zb9MuYix3rnHPBpj5EWecq2SfYYklzv+kvcs/cpNup
 xqDAh9yw14ZbLGlrlb7Y+bOu9ho0bBDwOXsA3+QAaAqlaaX0yGHrVC80zDxneC8n/yWkoif6z/8
 XVaVBM4diXrsMymfBBKbLAAC1hPmv8mEvtEUKOfJ9bfeA==

Hello,

I encounter this error when trying to build a deb package of the linux-
firmware repo :

jc@dingdong:~/kernel/linux-firmware$ make deb
./build_packages.py --deb
./copy-firmware.sh: 116: cannot create : Directory nonexistent
 dpkg-source --before-build .
 debian/rules clean
 debian/rules binary
 dpkg-genbuildinfo --build=3Dbinary -O../linux-firmware-
upstream_20241210-34-gc0f414a6_amd64.buildinfo
 dpkg-genchanges --build=3Dbinary -O../linux-firmware-upstream_20241210-
34-gc0f414a6_amd64.changes
 dpkg-source --after-build .
Built package: dist/linux-firmware-upstream_20241210-34-
gc0f414a6_all.deb

I bisected it to the commit :
[2b781910a7d0a7fd67e3d4f40fd8178004c588bc] Add support to install
files/symlinks in parallel.

Tell me if I can help.

Cheers,
jC


