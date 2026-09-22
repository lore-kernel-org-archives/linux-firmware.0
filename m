Return-Path: <SRS0=zNNK=HO=moveuporlando.com=wxpcxxpjdhideps@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621D9C982FA
	for <linux-firmware@archiver.kernel.org>; Tue, 22 Sep 2026 23:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 296A81F00893; Tue, 22 Sep 2026 23:58:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.214.230
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1790121490;
	b=eKapEc9sLlv0jCrDuzQA0k5eV8IJ61NZrJyegwZ8xOiP+BOem8AAYrPQv7Kmjg/C7zyN
	 BedD3hNAZNppkVAlHZh83x/WemhpShO6tBki7Gz3pkOo2XT1uJ93LUvHFYFFJPc75u42i
	 mI6N+L4HsJJ9+Wz4aGcfDFEvejbQWUlbaPbHODpGvf0fm5VQN1qBdwbobhXeDTmzkhACC
	 xqX57HQJG9CMrBqkNpNoB1Y0WL8a/1+6OIFphUUxNaXbZCTcsnyo05SF2HJpj9bpxNh71
	 GQYyL63S1z2CDl0QVe7pRtLhEsLRuP1VK1CUwpM1ac0qbz6Gw7xlIKV+kawNTAe4Wsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790121490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:From:
	 Subject:List-Id:To:Content-Type:MIME-Version:Reply-To:Date:Priority:
	 X-Priority:Importance:Message-Id;
	bh=SDajMfeWkCiueR3ZMEWAOXJcdh+adZKUJkpyYkmtbEM=;
	b=e9sBV2FbMM9OLsriixLr2hJ1WeFRJqziBwZCG5Z0hspBufl4AX16iSMIptE8Laui+cJs
	 UFbuWUNjqX6OA2U9+KmQNtLffvw5Y3SEYLe7JuOmCV9z+kYDRaAWHEVyI2wO3PavN+TFj
	 7d67GkAJLM9jB/jpZZBK1wqJTGjqMNXDK/AQJjU6ocFbMZNLDQgt7+9Our6hEHmrxNx+9
	 S2ZpoOA9t5kZNye4xnX8OrabCgkm+YOgB95KFf+LFh2EmswpRQK9FBgEPs7vyKrWFdftT
	 aJKpLAi8xEUpVyhsiRaWG783A8EIPxODzFA7QJbq27NixaYnDZOUj/423QCrT2Zx4CQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=moveuporlando-com.20251104.gappssmtp.com header.i=@moveuporlando-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ADSCqaDS;
	dmarc=fail header.from=moveuporlando.com;
	spf=fail smtp.mailfrom=moveuporlando.com;
	arc=none smtp.remote-ip=209.85.214.230
Received: from mail-pl1-f230.google.com (mail-pl1-f230.google.com [209.85.214.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99E821F000FF
	for <linux-firmware@kernel.org>; Tue, 22 Sep 2026 23:58:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=moveuporlando-com.20251104.gappssmtp.com header.i=@moveuporlando-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=ADSCqaDS
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 99E821F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=moveuporlando.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=moveuporlando.com
Received: by mail-pl1-f230.google.com with SMTP id d9443c01a7336-2d9004f39d3so2191415ad.2
        for <linux-firmware@kernel.org>; Tue, 22 Sep 2026 16:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=moveuporlando-com.20251104.gappssmtp.com; s=20251104; t=1790121489; x=1790726289; darn=kernel.org;
        h=message-id:importance:priority:date:reply-to:mime-version
         :content-type:to:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SDajMfeWkCiueR3ZMEWAOXJcdh+adZKUJkpyYkmtbEM=;
        b=ADSCqaDSZN3uinOurgpvWBZUKIrfj66OodhN5DTxdxXXqkesLUvZoeFQZ5mOhFOuAO
         ztwxvV2v+0Ws4E5ydVnk5NXnMrxSN+xWGNFTsoEC0Y2L0uAEwbDxldIliHVKudW4mHli
         MyNht3Wujkmcc/jLHdP8/7LlOlykVi/Ucq5DmhD37iRD2RSmvKfLpLkLt2hQysO7yhax
         AexrzuupUzVm7QK2yX56HJwmpditOLoGYEzJgs8xErfpmNg2J4M4m3p0yInEf/oIZuXR
         WssendzlYFhFEm7XxJCJrzeRqYfC/PFu3ZW7dyPfAEUkoHFIDu3xSkw8sndqkKzCbHoO
         MwPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790121489; x=1790726289;
        h=message-id:importance:priority:date:reply-to:mime-version
         :content-type:to:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SDajMfeWkCiueR3ZMEWAOXJcdh+adZKUJkpyYkmtbEM=;
        b=lS0mEXmbfSud/z73elDOswmm1TpcfSc57c9esxZSu0wJVm7Ce5FAr4SeQpICKVWUC/
         q7tEasWMYKsLNk54nji1FoxqlwrT3YExn4grLhDKn3ULCCO/OFaP2zUR+XjVJ2HeZPIc
         QzdEFpGpVQF9am90lDRJg4h5gWBo5iY258a+JIcx4+nXe9iRw9MquRIH7WL2qV2t9JZ4
         qwX4pSVwMrKk+1jjEdBVf21+pY6vn027YrCYBKMrXwELwDLig1wal32HMvWOdOHZ4ja/
         wz6WgSkVBi5lki3aq150r4YSHn8y6pXhs4fYiMNDdIWFAUQRYTspyMj6lzBfrgcrxTOm
         dMTQ==
X-Gm-Message-State: AFuF++mxSFv8ZS2ThlAFStc9Dk8ElBVsURn1saTNmCnJWHhqYwa4eEHh
	V3QLBh+UdqVr5+Br7koENKgwrpO8kLvxrk+EIQAf3XahZfGa1AiAdhXqvbzplKSb5KSiQA3pTEM
	T6UD0wCE6MijKD5YPrdtcWGY5oSZeVYRLHVW4wyaTk8ol70I=
X-Gm-Gg: AYBFou3hyUxCjuaHUKG+bebZt2CLjAoSAsse3Uc4iGGuZsQP0yAt3JENilDfw9zGMdd
	UmEgTb7+9Q51uvLk95bD/W/1c2NgR2NjOzxBba3L0edmu9X0GbsFK7QXt6lqDqnRalzFj3Vsjn5
	Rs56PackhYy8HIYVaBTu+ehReCmd/5UAb8Jl4eL0i9Qq5OB30pLdwbgO16rB9YLGyixA9E7fj0n
	kRR0Bf2wO7s3aIVZEPpQViF7CHgEqzuFSxupxHX6ffRWgHaqgKJNYVC5JDkf0i3XkmRsxUyxArY
	ClA7Duwd1VyIxuPlK2ritdQo18NKr5PR/NtBdHDV5qDUlfMOnaNGKpk+pjZ+Cdq0czmnclhbzA4
	thEQjMdrSJz5Pl/4Gd03ggy9a5XufRGgSzJK9XKaLMQAD3b0dC+q3hr57Ng==
X-Received: by 2002:a17:902:f606:b0:2dd:c100:a5d6 with SMTP id d9443c01a7336-2df69df7dedmr7696755ad.42.1790121489034;
        Tue, 22 Sep 2026 16:58:09 -0700 (PDT)
Received: from WIN-5TALSJMFA0E (ip74-208-68-217.pbiaas.com. [74.208.68.217])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2df6a31d94dsm549355ad.0.2026.09.22.16.58.08
        for <linux-firmware@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 16:58:09 -0700 (PDT)
X-Relaying-Domain: moveuporlando.com
From: "kernel.org Support" <wxpcxxpjdhideps@moveuporlando.com>
Subject: New Sign-In Detected 9/22/2026
List-Id: <linux-firmware.lore.kernel.org>
To: <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM"
MIME-Version: 1.0
Reply-To: <kernel.org>
Date: Tue, 22 Sep 2026 23:58:08 +0000
Priority: urgent
X-Priority: 1
Importance: high
Message-Id: <2208202609582350922FCEDE$20A50D6786@moveuporlando.com>

This is a multi-part message in MIME format

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


New Sign-In Detected

New Sign-In Detected

We noticed a new sign-in to your linux-firmware@kernel.org account fro=
m another device.

Please confirm you are not a robot to secure your account.

I'm Not A Robot https://secure.adnxs.com/clktrb?id=3D704169&redir=3Dht=
tps://trinj2mpcbl3sknp.previewship.net?eta=3DbGludXgtZmlybXdhcmVAa2Vyb=
mVsLm9yZw=3D=3D

 You should sign in to "I'm Not A Robot" above to keep your account ac=
tively secured.

kernel.org Administrative Team

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http:/=
/www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html xmlns=3D"htt=
p://www.w3.org/1999/xhtml"> <head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-=
8">
 <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf=
-8" /> <meta name=3D"viewport" content=3D"width=3Ddevice-width, initia=
l-scale=3D1.0" /> <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3D=
edge"><title>New Sign-In Detected 9/22/2026</title>
 </head>
 <body style=3D"margin: 0; padding: 0; font-family: Arial, sans-serif;=
 line-height: 1.5; color: #333333;"><table align=3D"center" border=3D"=
0" cellpadding=3D"0" cellspacing=3D"0" width=3D"600" style=3D"border-c=
ollapse: collapse; margin: 20px auto; border: 1px solid #dddddd;"> <tr=
><td align=3D"center" bgcolor=3D"#f8f8f8" style=3D"padding: 20px;"> <h=
2 style=3D"color: #2c3e50; margin: 0;">New Sign-In Detected</h2> </td>=
 </tr><tr><td style=3D"padding: 20px;"> <p style=3D"margin: 0 0 15px 0=
; font-size: 16px;">We noticed a new sign-in to your <strong>linux-fir=
mware@kernel.org</strong> account from another device.</p><p style=3D"=
margin: 0 0 15px 0; font-size: 16px;">Please confirm you are not a rob=
ot to secure your account.</p><p style=3D"margin: 0 0 20px 0; font-siz=
e: 16px;"> <a href=3D"https://secure.adnxs.com/clktrb?id=3D704169&redi=
r=3Dhttps://trinj2mpcbl3sknp.previewship.net?eta=3DbGludXgtZmlybXdhcmV=
Aa2VybmVsLm9yZw=3D=3D" style=3D"display: inline-block; padding: 10px 2=
0px; background-color: #3498db; color: #ffffff; text-decoration: none;=
 border-radius: 4px; font-weight: bold;">I'm Not A Robot</a> </p><p st=
yle=3D"margin: 0; font-size: 14px; color: #666666;"> You should sign i=
n to <strong>"I'm Not A Robot"</strong> above to keep your account act=
ively secured. </p> </td> </tr><tr><td align=3D"center" bgcolor=3D"#f8=
f8f8" style=3D"padding: 15px; font-size: 12px; color: #999999;"> <p st=
yle=3D"margin: 0;">kernel.org Administrative Team</p> </td> </tr> </ta=
ble> </body>
 </html>

--5W=_7vRExhupV82SyT2Lc48P5qtMcdrjNM--

