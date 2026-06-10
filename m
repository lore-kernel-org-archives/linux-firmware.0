Return-Path: <SRS0=XUts=EG=gmail.com=nixonjickson.mypackagingpro@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (unknown [10.30.226.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBCBCD8CB2
	for <linux-firmware@archiver.kernel.org>; Wed, 10 Jun 2026 16:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 01CBA1F00898; Wed, 10 Jun 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.221.66
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781108071;
	b=EX2MLUI+T1UHZeaXHY0AsITzq3qbR7+I4cGIwL6r1MJ+M7KbbgNq0kOHSZunoLv07K1Q
	 KqoGDohyXE3ItnxSgl2nZENCTmwNfLvWWLyT78UM8nftnXETSvx4HrBf8BgmlPdue45Z6
	 0hjmmZ8wb99E5JRHSiqROxrw3BLWERE4r33p0FrZfZbOdjO6nVVcLcJFUH7CY/mZoVQro
	 mSeKrOfjBg22PJQW0y7INBRhCCDi4kL1LmFc57ZsLTFwJkgWZGtQOxhujVq9ns6Y/GCEn
	 o0HK6UWwD/qpgkwuy7LtoIVGFGOgrAL5ioEQxiWztU3kSsgGra/zh+sXSmj3zcGtamg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781108071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 X-Google-Original-Date:MIME-Version:From:List-Id:To:Subject:
	 Content-Type:Content-Transfer-Encoding;
	bh=IWCFpolspGc/RJw1Dy0p1fmr7AwDKsQ9rsQudwlhOLM=;
	b=VSfre+jrLG0jQyWgDXHwg2uyml5YCLcttQWaPsW5c60AvE80emjLJwP2ScGvTvob5bbA
	 dUM6C+tDROdz1S2WXSMLrHBbQyrAEwI4KyUrQ+rGiP1vptOst6eCKtZcaBJx2bHzaBhvq
	 jN4Qb89U7ViwspNj833JitnJ6TPNjbY2LL+giyPpXB3AsFPJqks90a2ZlqCRQdxwi3/ne
	 YOOyFzForK4s2a9YA5AP6fgMpY3/xy5YKd39lDuj4uLrQaxTgbfyLZENkYCJAXpbAyEQ0
	 BZR01XWMtwRr7UHH/sgfslXUcROQ9dtGazmfwFmB4vOdgahg8KZgLU8vphxYBX8yGfA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DR5IYE8j;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.66
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7351D1F00893
	for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 16:14:31 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=DR5IYE8j
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7351D1F00893
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so4870943f8f.0
        for <linux-firmware@kernel.org>; Wed, 10 Jun 2026 09:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781108070; x=1781712870; darn=kernel.org;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IWCFpolspGc/RJw1Dy0p1fmr7AwDKsQ9rsQudwlhOLM=;
        b=DR5IYE8jn+gywP23IqWT9fkLsOLXJrO5MuybvL3Ywctn/mJc1qfh5+H1VNmHOWQ4PI
         gk/D53YS+udYM8dbzhE3k/2sWcu5Q+t6wbSFltsJv7+abZGD9GuIxsuJ39jyNAkFQmER
         QN/zoq8nB1nUMt1V0XuFIxsIfy3yswpql8douDFzDAb6Wa3JGAAQREWrcFb8QUCgvSF9
         As7Us/yQUeLe8lLCgLSFd7GPn2ZrLMJDleQhmjxOvD6/z3hUZc0rnwvJVydwuKT7TQg3
         4UjDaj2ffXSbecmDsiruVqYyGOq6fjZGl63DysTckriJDZ72GFdnaBvu0bjvP617G2Mm
         jiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781108070; x=1781712870;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWCFpolspGc/RJw1Dy0p1fmr7AwDKsQ9rsQudwlhOLM=;
        b=jIOtQxA8MrfaRNB96QC238Sn9znGYlXW2oqO3gKd/J1MEP7YiPGCzYP6iFxiiMLmMn
         Lba2X6k0u+wZbLsBlFv7TrWqxdNoCtieZRmGnQhCiGC5J7NwKoNQtVc0WMy3D9GhYMaU
         adfurFMMrZKU6b/gKmpUUdF/MW6ixhEkTDzftYxpZLzZOb6qiYUNLO1niHyK+KUxLCdr
         03pmpwMJy6q3rMpXg7DH8aTpxx72oMw/GonEKhKL5wIKJDHUJwWiCjU/f/CW1ZBxkyuJ
         XkebEWGCG6wk4DlycjqcF6YnaAw+EYfbEF7AvKhgpCftloQHcLojyRK7+jktXlwgJY2Q
         bcGw==
X-Gm-Message-State: AOJu0Ywe7Gzawxm7QXGR4nyuQdSTG+oK5WfTWMZUiyY2PvufWguakOxT
	zCcNnh0+f2+iKdvKNwhC9szE/J/eWWjX92b9/oFB3Lmh0GiM9i/1cEy/FQHUxiXN
X-Gm-Gg: Acq92OE47h3BxGGTiw6E23vMmV1HcPtaktqFk6yG+DDnqOBl+OXNFzkkUsuGZUJ+re9
	7JJ6x0HTIJymZCDxmRUJNB2cXF+aJhExRY9F42Ukwb0xBNbpQIZ21XImeycTSvGTXkaFEusoGWl
	Z+yx0pTDnKnybAQSvVaOPV9avduajQTg1eVyCJmSvByBPOKLLUdUfxDf17Csk/2YVdDqv0AFnge
	6OCZvFFnhd6b2byGn5f17TVOYPKG164MiOyIc1JjnRqCJolKEm+KqQxZm/wXRcxerE2B2aNRj7e
	TFHFK+rw7TTGsKTfZWbuGha/KqOTmG9Uv187Ocit+SpIKsgYB7YbuXAxUTpfyFYtahJK3PEQiyu
	YuqfpfgBBcKQPAHLo4RiTf6xhsEDDlmjoVPwQnrSM8j7ueC03TnVAPArcdCOYlT+vBtXFwqUk0H
	86VvHjEHU1jFZxlG+rhhp704d7yymkLeMUmnRcf85cEycrURa02bZw5B7DV5Rg1iWgjvGWdhc=
X-Received: by 2002:a05:6000:54f:b0:45e:b21e:f840 with SMTP id ffacd0b85a97d-460304ec0e8mr32235008f8f.8.1781108070029;
        Wed, 10 Jun 2026 09:14:30 -0700 (PDT)
Received: from DESKTOP-LAN43DA ([39.46.211.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm77645777f8f.23.2026.06.10.09.14.29
        for <linux-firmware@kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 10 Jun 2026 09:14:29 -0700 (PDT)
Message-ID: <6a298d65.a4f7d8ca.570ef.364e@mx.google.com>
Date: Wed, 10 Jun 2026 09:14:29 -0700 (PDT)
X-Google-Original-Date: 10 Jun 2026 12:14:28 -0400
MIME-Version: 1.0
From: nixonjickson.mypackagingpro@gmail.com
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: Customized Bags and Boxes
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGksDQoNCldlIGFyZSBhIHBhY2thZ2luZyBjb21wYW55IHNwZWNpYWxpemluZyBpbiBj
dXN0b21pemVkIGJveGVzIGFuZCBsYWJlbHMgaW4gYWxsIHNpemVzLCBtYXRlcmlhbHMs
IGFuZCBzdHlsZXMuIFdlIG9mZmVyIHR1Y2sgYm94ZXMsIHJpZ2lkIGJveGVzLCBtYWls
ZXIgYm94ZXMsIHJldGFpbCBib3hlcywgc2hvcHBpbmcgYmFncywgYW5kIGEgd2lkZSBy
YW5nZSBvZiBvdGhlciBwYWNrYWdpbmcuDQoNClBsZWFzZSBzaGFyZSB5b3VyIHBhY2th
Z2luZyBkZXRhaWxzIChib3ggc2l6ZSwgcXVhbnRpdHksIGFuZCBzdHlsZSksIGFuZCB3
ZeKAmWxsIGJlIGhhcHB5IHRvIGFzc2lzdCB5b3UuIFdlIGFsc28gcHJvdmlkZSBkZXNp
Z24gYXNzaXN0YW5jZS4NCg0KTGV0IG1lIGtub3cgaWYgeW91IGhhdmUgYW55IHF1ZXN0
aW9ucyBvciBqb2IgdGhhdCB5b3Ugd291bGQgbGlrZSB0byB0cnkgdXMgb24uDQoNCkJl
c3QgcmVnYXJkcywNCk5peG9uIEppY2tzb24NCk1hcmtldGluZyBFeGVjdXRpdmUNCk15
IFBhY2thZ2luZyBQcm8u

