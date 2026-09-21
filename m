Return-Path: <SRS0=WHLZ=HN=gmail.com=kalifhalimo965@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9246CC982E6
	for <linux-firmware@archiver.kernel.org>; Mon, 21 Sep 2026 17:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6354F1F00893; Mon, 21 Sep 2026 17:11:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790010692;
	b=3GnogLjXFgWT/eXDZLPkbwqfwOZpCR6U8nCQDeRK1DiQRz6Fyp//UVGVpP9+v7q4CI5P
	 AjUCa7az9HAUTOuqNgNaM/zC4mdQeLcj0vX/t1d0L8kQZbWIOKHW/epxMnijD1Py3kiL3
	 +0W/HDYVvRZwZ3QQP40JnF4VNF3UrxJgzfXlBLry0ENvURK3G7BlAE51SG4iQ6EPmMhpF
	 DvPFLG88l0rOEQVpGz0n8kSqpOXSQnmWQGyNuRJdSGw4eDqJvUUsDPCYmpEo2z+Mhjdwj
	 MloLAxg/NJg4DPQSTrJWjTBqLQVLu5vq5QeAjK2s2XMdgxThvhNHA60DbUX5uFxRXmQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790010692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:Received:From:Date:
	 X-Gm-Features:Message-ID:Subject:List-Id:To:Content-Type;
	bh=zNxq3nPxOxWOkpOGX7fcGDHAYRbZmpwCfB2fTzgllkA=;
	b=IbnsyklqJKuyrh2LfawFpYnjEFxJj6h9NlhoACaqk543O0ME2/FquhkXBldNIqH0RIH4
	 uQOen4CNGXYw/Z8ZX/i1FS92SYNN1/aRGgzORFHmEpRK/9smKbUbcusxF4U4Gr5opYiob
	 tLj5lCQ07jbgjr7AKwHNLL0clQDW5Hw9YCG7hLlW+Ti1j3ylZS8RbFKm3yfnqWl4MRYrh
	 zwnkTcVohNsZVHlPsSbT50NnVFFZQicjbaC9t9RHUPSPL3uexyROtYfzhmHiycxL2Z+mL
	 vf8jHpcimaUgMw4/PAigqUWANBVxn7D+un620yNu274yB3UjAL2uuW/XVeZAwDtvnhA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m06IygRc;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D332F1F000FF
	for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 17:11:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m06IygRc
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D332F1F000FF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a5a0703ae7so801711fa.0
        for <linux-firmware@kernel.org>; Mon, 21 Sep 2026 10:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790010690; cv=none;
        d=google.com; s=arc-20260327;
        b=OjTYvpaGTn6tK0LorZtFhSAWNEz1DzJGtDZ6/1pCP2wcKJ53+fKns+7g0ZP9R0VY13
         R9Ovwdl6ULzAZnLHFV+PgImkCYhUhQMSp4XxaQ3V23tTAotL7BusjuX5M8C1zGEBwj2Q
         ZAE3TLx1g6lYnWWFytcikxcLwaAiEcPZi5oDxWaFt5WI2tVoST7eAYzknrsdLV6p3Hco
         cppbv9zhpmZYP9Z2dPCZDkFkeu3VFvgNFReI0Mtyp4J5VlmXrOUEfJWkG+630QmnbNVW
         LEznEW2AgswFKk41DxHlYIOZMlDvYKo8tXNSLsQtfZIC19XFcwbGjSBo6jNwUTjCeY+X
         AATQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=zNxq3nPxOxWOkpOGX7fcGDHAYRbZmpwCfB2fTzgllkA=;
        fh=thzlYDAT27MWbzz3if4rQyeooyybPz7D/zeQezHlJZA=;
        b=ak3XSyn88xbEQEouApyrD6x3ri54Vci6VkehFCOinjBO/ltWr3zkCFzyyT5Cum8jvx
         93XqbHTkBPBz+P9tj2t/PFlpmhanYCA15UpKZVTkR4J7voPg7odvUCe3wPt0wqiFLj7F
         PGdDHrkGow3vM2JTbcyytrmWjpmunAUEVUdfQQUKBlf+QWVYAh+41sPS4H2SXTkAkfNE
         XkuQQPGKeq9IYJvzpAxGdDwwoc+IWI+TEmr0uAiamIB7TZCMfWC51rJ68si1FBjNpUft
         k+YGWoImbvzmOPNKx/168AZPg9NfJXhn87y0e9xyF3cp5oHBYtMrlPwhcr5/co2MnOEF
         /iBg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010690; x=1790615490; darn=kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zNxq3nPxOxWOkpOGX7fcGDHAYRbZmpwCfB2fTzgllkA=;
        b=m06IygRcjBq9K6P3JVhX2xv0VbJFtzfx7OoLm6fOkbTZDwBPhCgj95LEDAeArSe/QI
         rARByajYa4LP6k8x8zkyKjQgMDx/S3V7TC9KyR9BOSMwKR7TP7S9T2aFo4tBiSsCMo5w
         ccU4X/8PhgCa6PM5GOhphTRop4qVDAhyQ5vSkXCZNZou3kICGqy781xGKGxhflEGGZCa
         yYqDDn/bc5YtHugyEnLP52YraftQ5f9RIQtHS4/XjQNfCm5F4OmZfsAyrLE7XBNiSJHF
         iDwGXoAyzhjWeeXFM485KtugF2hMGtbF7MiiQBBTgSXjs2+ky4J2LTb/PQoOLHCvr517
         ULIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010690; x=1790615490;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNxq3nPxOxWOkpOGX7fcGDHAYRbZmpwCfB2fTzgllkA=;
        b=OXv6MYHvtVKeHfBi23jcxSItESOSV0MJnyOlHhct+eRP3cRcL5XmE3XrtFBpmmqygH
         7Lt+HS/On/5WU7wA3PludyJ/c9KjpVCcMFqtfeGnlns5zvnmB8HCbU9BDTKkKYgRiBgi
         +3CBoS6BswyIsBWWrsY+YjwnbKcMgPcDuaFUDDlgO3FHdp8EF4qxZfoOs7VGeu0uYjdR
         ZJwxEF+cCmh1hMcjoTpq98j00OdJiBRvp7MMUomc1+WRE3rFWq6Tir6mAnJSOVdnE8RO
         9oYHN730zTrSOrUX9GnsV0+2afx3b5KMSt8kl0m4DA3F/itVZWTQSkQf0TLFowAuZKSF
         t4qA==
X-Gm-Message-State: AFuF++noviCC78SCLVe9kWP3lAhI2S7pmd7e+y6AGXj/wof1EjvzyOpI
	iU0TcyWS9/cTx4FHUkWqw6mPw15UeZ5b+zkv/tBsP/HtliNavb0kmE4RuwnU4mHgecTsQVLR8JA
	KuW6184igfpkIZE5bbpGtnB9Ws1LBxQnr/g==
X-Gm-Gg: AYBFou3DRpigh4y0ooEvI8Bvq3xjsiqHX08IWDAJUHyXwKLhwJ3OfQ3pSJxj7g8koH1
	pOhpUVpMAeVdw9rmjyt234UL9A4a0fkvpJ1NqVPBfTU4LzD8ebtNB8IPCJpZKFIzvluUMdFJJhS
	MG9ZOQPgAOpkacRdmAs2bk6V7i7UCm8ZcrmepOojMHcm48zAEZYWaLxrvy5r0AZMKktLMAAKApv
	sA26M7tXG1op0oQ+mK4tKrq7Lb6sz4nONCyRfCyZpRFkMvYLyRyEkSkWF7CXH+XCPmOcvYt4YQI
	Njp4x+wLPljTs1pHDaGiiDnte6O2VXemnHVMgSVDmu8S9VfNN0omYZ6IqTyWKKVe+XPzzmqaR+R
	hj96gQ18MD+k=
X-Received: by 2002:a05:651c:198d:b0:3a4:68f1:8bee with SMTP id
 38308e7fff4ca-3a624cb3235mr629841fa.6.1790010689755; Mon, 21 Sep 2026
 10:11:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:651c:a212:10b0:3a4:74a1:80d3 with HTTP; Mon, 21 Sep 2026
 10:11:28 -0700 (PDT)
From: Martha hiddleberg <kalifhalimo965@gmail.com>
Date: Mon, 21 Sep 2026 22:41:28 +0530
X-Gm-Features: AcwNN1XadsYC0WdcxAhxaWGZmkCJ-OlkEoEE6e0tLz3omMmgeoAweSA8txELZyg
Message-ID: <CAA3=2yJCY3XZOd6p9fnj6vqiK4H_ywoWuLECEH+oGGxhzD13ZA@mail.gmail.com>
Subject: A quick website improvement idea
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Content-Type: multipart/alternative; boundary="0000000000004e9e46065c0157d4"

--0000000000004e9e46065c0157d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Victoria Family Dental,

I came across your website and noticed a few areas where the design, mobile
experience, and overall user journey could be improved.

We help businesses modernize their websites with cleaner design, faster
performance, better mobile usability, and stronger calls-to-action.

I=E2=80=99d be happy to share 3 quick observations from your current websit=
e =E2=80=94 no
obligation.

Would you like me to send them over?

Best,


Nancy

--0000000000004e9e46065c0157d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p>Hi Victoria Family Dental,</p><p>I came across your website and noticed =
a few areas where the design, mobile experience, and overall user journey c=
ould be improved.</p><p>We help businesses modernize their websites with cl=
eaner design, faster performance, better mobile usability, and stronger cal=
ls-to-action.</p><p>I=E2=80=99d be happy to share 3 quick observations from=
 your current website =E2=80=94 no obligation.</p><p>Would you like me to s=
end them over?</p><p>Best,</p><p><br>Nancy</p>

--0000000000004e9e46065c0157d4--
