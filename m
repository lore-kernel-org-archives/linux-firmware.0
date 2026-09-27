Return-Path: <SRS0=K9kL=HT=mail.ru=lmybizexplore@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21BC9832A
	for <linux-firmware@archiver.kernel.org>; Sun, 27 Sep 2026 02:09:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F2B61F00893; Sun, 27 Sep 2026 02:09:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.163.59.82
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790474945;
	b=SL9+lzWDIbQRmONARnVEkZyAaT2kFOcOQd4pYebfuI6ybtWPe/WLaHB3+DZz4Jp8/BjT
	 SWyUv5Jihyma+/2zchW6V7GzpcOvkkhYhplNmL26Op0PkiiuQNtBfBGdsLYN6PRz2TmyY
	 S5LaneeHXhSkwgK40AUhxyhLIiUDLEALkXCbJRLtSH//LJCd2sTEEZB1hs8AGXD7Xffan
	 tcuLVcoBWxdS2xNu2kn+Rq93yKlKZPlkWw7MMi7m7EbkuSTuc0EYjad+p/SROBPNUUDpz
	 3CJiQOHl9Q5+1HSotpQpiugh6bJm32t9odXskeE2HKnxop89ik3LNShsrHR/Z+SmMNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790474945;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:List-Id:To:Message-ID:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailru-Src:X-7564579A:X-77F55803:X-7FA49CB5:X-C1DE0DAB:X-C8649E89:
	 X-D57D3AED:X-Mailru-Sender:X-Mras;
	bh=eJxsPh9AUcagKv8JWeMDkafYgJLGYXRhFotf88Abiko=;
	b=eUBiE7SOvCMPUJCjdFXmPKHxKW5QP1OGNzaj3o8fBZt/1MunTqagUr6b05mMVmaWnkwz
	 T6NS+KxFg9YAKbdhIsxkoT1p/haH8SDqjMt8hbDKSBlTMXHPVzdXNTahmPgGJSh5Ml0ep
	 Mk0XEyA53F40Mh37LtRvne6+oyZyroC+ILm0idddc1GhLTDZCQ5lqwnXbCw3oXGoBQ+cb
	 JUv81e2wZklm5785HD9LA7gwNdbTUINfQigNeuk78Vqw83QJxu5sDYO6Q+PctfQK17D61
	 RkiQkoA3vZb7ez0NW/GT00ifNOBsjLsLWAmX4CO8tbKdqybn2JVGaVZ81YOllQA+rbA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=fail reason="signature verification failed" header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=WJmwpukB;
	dmarc=pass header.from=mail.ru;
	spf=pass smtp.mailfrom=mail.ru;
	arc=none smtp.remote-ip=95.163.59.82
Received: from send243.i.mail.ru (send243.i.mail.ru [95.163.59.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62BAC1F000FF
	for <linux-firmware@kernel.org>; Sun, 27 Sep 2026 02:09:03 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=mail.ru header.i=@mail.ru header.a=rsa-sha256 header.s=mail4 header.b=WJmwpukB
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 62BAC1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=mail.ru
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=mail.ru
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail4; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	Message-ID:To:From:Date:From:Sender:Reply-To:To:Cc:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
	List-Owner:List-Archive:X-Cloud-Ids:Disposition-Notification-To;
	bh=eJxsPh9AUcagKv8JWeMDkafYgJLGYXRhFotf88Abiko=; t=1790474942; x=1790564942; 
	b=WJmwpukBcRoqW1QTcudvKTt/hCXa+BXq7Md32bfNRjbNpxuHFHTru9wb5algjpFJhvIMGXZnKTB
	Q1Nfoq9VUkrkLBmhqtdnGRwbtkK4d6pF/6lyT21IdzWxte5qinbCtCEHi5UBHArGj7cFNjsYvtKVw
	vEDiaRU5fQwsfJ0R02mGtCPtcYkMwrKnNfrUu7VbA4J6S9RC40MwR8HrbF93hWOxxJoK/D1bJLBey
	eKkfAZn/dqaN5TlThXyJssQwOJAlTCykLCk+cOmqR9VqXqWDaFaXHkgY1zaGT9rYv1poe+jfrSfSu
	9YbPzFPHNNKC9ZAOg5FhE+jitCWQp05eo2FQ==;
Received: by exim-smtp-5b54c96989-zkrhs with esmtpa (envelope-from <lmybizexplore@mail.ru>)
	id 1xAeJx-00000000DS3-3YOw
	for linux-firmware@kernel.org; Sun, 27 Sep 2026 05:08:54 +0300
Date: Sun, 27 Sep 2026 10:08:50 +0800 (CST)
From: lmybizexplore@mail.ru
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Message-ID: <1807849257.2185.1790474930373@9c03aba144ce>
Subject: Regarding promoting the Mesa 3D Graphics Library through automated
 outreach
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Authentication-Results: exim-smtp-5b54c96989-zkrhs; auth=pass smtp.auth=lmybizexplore@mail.ru smtp.mailfrom=lmybizexplore@mail.ru
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD923F1B5F87BDC70E64AF0A17C2F4B2F6E57F2A3E41A7A5635182A05F538085040EAFF8378ABD7C5563DE06ABAFEAF67059B036A0D65D4B0558300DE9FB6A90372263A0BA307171318
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7235646FAB97B4BEDEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637FE9EFE935CD7C6AE8638F802B75D45FF914D58D5BE9E6BC1A93B80C6DEB9DEE97C6FB206A91F05B200B679CAABF2D6572E070BE324C7D3C4A39F8CE118DE4848BB0A4F435E46E6718B35066C979671628AA50765F7900637F3E38EE449E3E2AE389733CBF5DBD5E9D5E8D9A59859A8B68424CA1AAF98A6958941B15DA834481F9449624AB7ADAF37BA3038C0950A5D36D5E8D9A59859A8B65C137F56075BEB0576E601842F6C81A1F004C906525384303E02D724532EE2C3F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A3920E30A4C9C8E338DA16BC0FC73BDF143A43847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 0D63561A33F958A55DADC8F5279983155002B1117B3ED6961258D87CBBD3A0E630E4A65F242F5898277AA237ED671D4372AF3B35EA4094CC86A7C529F68B8E5C9C5DF10A05D560A9D2B5782620B851B7C8C84E951CD0BE2F58C12E6D310A6D53F80095D1E77F4578A71A35648BE338CEED902CAAD3CD6B00BA7CCD254A1CF5E8E99897350C7C491EC627013B076BABB6939BCEF9C803809F171B36006FE6251A
X-C8649E89: 1C3962B70DF3F0ADBF74143AD284FC7177DD89D51EBB774242A1950755802D361004E42C50DC4CA955A7F0CF078B5EC49A30900B95165D34D1AE09A115117C96777590F7C1596FF401DBE2995AE1E66E47460A57337F347A334FD279E137C8951D7E09C32AA3244CE9E4A90DA64F0BA477DD89D51EBB774246CBFD8D65364997EA455F16B58544A2C99F59F2F009F096018C5230B085990E919DDB6AC1ED31FFF1CDDE959AC76B5C964550E41902C4E4
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu53w8ahmwBjZKM/YPHZyZHvz5uv+WouB9+ObcCpyrx6l7KImUglyhkEat/+ysWwi0gdhEs0JGjl6ggRWTy1haxBpVdbIX1nthFXOcIETfglQORZ0zpDET4Zrk3igikrdHlWCCzvd6pX0vMtEW4g7DlDWI=
X-Mailru-Sender: 9C17D10B238D8B9B47E7CFD794F4B943D19788BB45F062EDB951B70A5BD4BD8E951C855C6367F65D4C683740FFAD31F6A59D6BEC59BFDCDD3DCCF50608321A3F9B3666A30D01B465016C7DB71B48C40BF8BDA277DCE1E2E86B952FAA15F080A467AFE9CA6190D88F287DB6D8621EF7B9C77752E0C033A69E3453F38A29522196
X-Mras: Ok

external-mirrors Hello, I have been following the Mesa 3D Graphics Library =
project that you are maintaining. The technical depth of this project in th=
e field of graphics, as well as its contributions to the open-source ecosys=
tem, are truly impressive.

 I am a business specialist from Weifang Leimingyun Network Technology. Our=
 team has been working in the open-source field for sixteen years, and we w=
on the second prize in the 2025 Xingzhi Cup National Artificial Intelligenc=
e Competition. We=E2=80=99ve found that many outstanding developers possess=
 strong technical skills, but they often struggle with finding ways to get =
more users to discover and use these high-quality projects. This is actuall=
y a path we, as teams deeply involved in the technology sector, have also t=
aken before.

 We currently have an independent automated promotion system that can searc=
h across the entire network to find users whose characteristics closely mat=
ch those of your project, and then engage with them automatically, thereby =
delivering the project information to potential users in a precise manner. =
I would like to invite you to give it a try; we can provide you with a free=
 system license for two months to use for promoting Mesa 3D or your other p=
rojects. If you find the results significant, you can choose to purchase it=
 later =EF=BC=9B Or if your project receives 200 or more stars on GitHub, y=
ou can continue to use our licensed version for free by simply adding our l=
ink in the README as an exchange. I was wondering if you might be intereste=
d in giving this marketing method a try?
