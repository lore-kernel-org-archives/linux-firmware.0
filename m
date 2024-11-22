Return-Path: <SRS0=ZBrL=SR=gmail.com=thirphattt05@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED09BD75E28
	for <linux-firmware@archiver.kernel.org>; Fri, 22 Nov 2024 11:11:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C6442C4CED0; Fri, 22 Nov 2024 11:11:41 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F247AC4CED1;
	Fri, 22 Nov 2024 11:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F247AC4CED1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f195.google.com with SMTP id 41be03b00d2f7-7f3da2c2cb5so1393274a12.2;
        Fri, 22 Nov 2024 03:11:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732273900; x=1732878700; darn=kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fKWYclILh0wkSLIEU8fm6Nlhcn8x+7x+Cw0m2YcfETs=;
        b=OU2l3eMaWjN91FYA0I/skxE5bPABogrubPtRiHRjHPcH0tr3H0fGuwMS6U86rd+dcb
         /9Es1mubYRbIaHL2Xz4994K1pVrW0USQ9z929N3ouWX3R9QU+x8Kz5F8jErCTXG7yDTh
         3cu7UXP4os5/xXf1rvhkJorwNqPows2Q3JU9wvZwwRubg67eve813QPbUCq7DZkzSGcR
         2KbGTQnpYVtezYLCn/ZFFlRid8a27bS8Pilsnv1TAbjJyF2w8JsxHj6WObgK0ecOaiN1
         N0m0oer/s5lYRLAwYa1U4Aa+dEPoRj2kumRWSzUmT3bSUGEsJxo8emg7f3qgzpmkvvjx
         J+zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732273900; x=1732878700;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fKWYclILh0wkSLIEU8fm6Nlhcn8x+7x+Cw0m2YcfETs=;
        b=gOSoJ6w/u8P+JGwaMM2Cdg99lEXZ67xgNiw/XIbl21zyYA3wnhhF+F4oTBk0iiE+sp
         KG6u+88qi6hwNt41CDwfM4Ftz0X/0UNWnplZE95UyEU174zhiJM1GFCeUhAPBUvTWALX
         p+zpF1W1iD9XBtpw9J6Np2SRMdfBKExT4hE7lN0gJQtM1kKAAFPZyOg4+/p5JLtgSaEA
         s6X+ptKqEXhJYw/iPqOzf6daL3Hq7aHu1N/ShBTX2wuahnaQWkmnyYA/aTJod50+s12P
         52taZMO6NAMnyIEjrM2+4arVXjKIBjuT+QVJ1uNfqot40mXza8WBDpgKeYl0fssu+0WB
         /+TA==
X-Forwarded-Encrypted: i=1; AJvYcCUwuOW2HkJZe6hpjMRIGtEHjbBI61CDUCuHlLqbYVodqltRWF6J2pcyAZlKHFyoc2WyNHtqmUCJ@kernel.org, AJvYcCVJqeH446ecXoNxm+PgJRnxNcAF5GIxVv5gnZu4ANuBRsHbFnj77IioxK3ZMLF/rYh9Mo3wSKedCCy/aGdnHQA=@kernel.org
X-Gm-Message-State: AOJu0Yx49COB8FAzewFmNon49mBqsBN0j0bTbnRnucHb3xI7HHq1gAhi
	cL7UIfoBqkaYQwzQFXyA4yYHJVwhcxLJYPXBWCfHuLlyY3jr4ErcnYURRvIRxyfjyhvhJGq8uVP
	79xz5BOPdc5g5TYxjZl4+IriSZtdUxP8QdL0=
X-Gm-Gg: ASbGnctbpS+i42QJ9g6Jxz3hu7Y/53XsV4YhYBTuSYjrbX2oeuvseqLJy0uOoyKDjG3
	mkiTeq56flJoZDafTU33xN3f84X6Vz8vmbJn9NyOkCcFc9Fc5J5gf9GgsrVeSC7nBaw==
X-Google-Smtp-Source: AGHT+IHxsnGEQR/4hhchXSn+CT05vUn/AxZqo2AaEusZ57IUDtWSpm6MOdtOnwODFQaX8qIpLlXbKwoRVNRmhdQQnJ4=
X-Received: by 2002:a17:90b:3bc5:b0:2ea:98f1:c17b with SMTP id
 98e67ed59e1d1-2eb0e024bf6mr2499734a91.5.1732273900220; Fri, 22 Nov 2024
 03:11:40 -0800 (PST)
MIME-Version: 1.0
From: Oliver <thirphattt05@gmail.com>
Date: Fri, 22 Nov 2024 18:11:35 +0700
Message-ID: <CAC+OJWCup7f4ysTLoismSMF9TkBD34pHqjRV=AGQGPFW2Wvs6w@mail.gmail.com>
Subject: =?UTF-8?B?4Lii4Li04LiZ4LiU4Li14LmD4Lir4LmJ4Lia4Lij4Li04LiB4Liy4Lij4Liq4Li04LiZ?=
	=?UTF-8?B?4LmA4LiK4Li34LmI4Lit4LiY4Li44Lij4LiB4Li04LiIIFNNRQ==?=
List-Id: <linux-firmware.lore.kernel.org>
To: john.allen@amd.com, linux-firmware@kernel.org, jwboyer@kernel.org, 
	thomas.lendacky@amd.com, 20210910160455.225393-1-john.allen@amd.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

4Liq4Liz4Lir4Lij4Lix4Lia4Lic4Li54LmJ4Lib4Lij4Liw4LiB4Lit4Lia4LiB4Liy4Lij4LiX
4Li44LiB4Lib4Lij4Liw4LmA4Lig4LiX4LiX4Li14LmI4LiI4LiU4LiX4Liw4LmA4Lia4Li14Lii
4LiZDQrinIUg4Lit4LiZ4Li44Lih4Lix4LiV4Li04Lin4LiH4LmA4LiH4Li04LiZIOC4quC4ueC4
h+C4quC4uOC4lCA1IOC4peC5ieC4suC4meC4muC4suC4lw0K4pyFIOC4reC4meC4uOC4oeC4seC4
leC4tOC4nOC5iOC4suC4meC4o+C4seC4muC5gOC4h+C4tOC4meC4l+C4seC4meC4l+C4tQ0K4pyF
IOC4peC4lOC5gOC4h+C4tOC4meC4leC5ieC4mS3guKXguJTguJTguK3guIHguYDguJrguLXguYng
uKINCuKchSDguYTguKHguYjguJXguYnguK3guIfguKHguLXguJrguLjguITguITguKXguITguYng
uLPguJvguKPguLDguIHguLHguJkNCuKchSDguJzguYjguLLguJnguIHguLLguKPguK3guJnguLjg
uKHguLHguJXguLTguKPguLHguJrguYDguIfguLTguJnguJfguLHguJnguJfguLUNCvCfkY3wn4+7
IOC4n+C4o+C4tSAhIOC4peC4h+C4nuC4t+C5ieC4meC4l+C4teC5iOC4m+C4o+C4sOC5gOC4oeC4
tOC4meC4q+C4meC5ieC4suC4h+C4suC4meC4nuC4o+C5ieC4reC4oeC4l+C4s+C4quC4seC4jeC4
jeC4si4NCuKclO+4jyDguYTguKHguYjguYPguIrguYjguKHguLTguIjguInguLLguIrguLXguJ4g
4LmE4Lih4LmI4Lih4Li14LiB4Liy4Lij4LmC4Lit4LiZ4LmA4LiH4Li04LiZ4LiB4LmI4Lit4LiZ
4LiX4Li44LiB4LiB4Lij4LiT4Li1DQrguKrguJnguYPguIjguJXguLTguJTguJXguYjguK0gOuKY
ju+4jyAwNjItNjY5Nzg3OSDguJzguLnguYnguIjguLHguJTguIHguLLguKMNCg==
