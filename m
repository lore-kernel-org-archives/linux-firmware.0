Return-Path: <SRS0=el3G=WN=gmail.com=samk.threatsecure@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050FDC36008
	for <linux-firmware@archiver.kernel.org>; Wed, 26 Mar 2025 11:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BDC30C4CEEE; Wed, 26 Mar 2025 11:39:09 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D20AAC4CEEF
	for <linux-firmware@kernel.org>; Wed, 26 Mar 2025 11:39:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D20AAC4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c55500cf80so524053885a.1
        for <linux-firmware@kernel.org>; Wed, 26 Mar 2025 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742989147; x=1743593947; darn=kernel.org;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=B7FQPQzvcOWpPd/eIvwXg6O0WRBq5ijwrGvQM50uDDA=;
        b=Vt3vRjx7ZCtLqgkbYa4ZjeV2HXH60Uhw9kFU6jMrh7jtS9NfIlQJgQM7M2Ib8KXfQu
         rOpcmGqx5RRcL+ZuwlbNX9xlDgkmZWOVoq4nZ+oJbhshnVnmL9pekMRuGWeLpblRd+Cx
         d9i2yowbmwNYANtKmOBp+YORDQ5ipZi7aUFaCn/Fu2BOupx01VXoNDFYzqlHhGS8//TJ
         gAtOyvM2aj3yhUbMYWoDiMy+cerR21cO1FtI2e1XjVnWHlISBdp5PjLNiheh5cJkk616
         LmTPnkCWTxzpJKgdGadZKdzVBBRe/c2D/jIgivuaP3lYLXSm7OgiN4IKVE2m4lEbKI6h
         lg/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742989147; x=1743593947;
        h=mime-version:date:content-transfer-encoding:subject:to:from
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B7FQPQzvcOWpPd/eIvwXg6O0WRBq5ijwrGvQM50uDDA=;
        b=U+SKr7d/slRcJY79FfMq4mDpJwdn0EOOkeO8SLGOJF6j8nrYPF8dB/+MUa8GSldnvZ
         WeyZObn5Hf/qYMB5OGRab+OOL2vddfxQ4JgzyVTlwgmPkkqx8UYXldVs8GKysj0ZDHvx
         fcwbrait31BkCdqHKu+1MbviMckZrBT3p/2ySMdfRThpk+E8j1bcxZwG92hUao772bc5
         trVjJZ1k1nfH2ZQb+g0KnE12QrZxfWoo2PQZOIRpj8pOp3DGA62DpkjErLod6G31iaBX
         E+qdVUJ0qxjLJ+TNzJuR+tU3UFNoxPqX4EwU93dIrLfmJ0zCd3b87yon/vE8ZPfm2DXc
         JBoQ==
X-Gm-Message-State: AOJu0Yxt+wMd+J0Qzmktz+lbyvmhthcPo2NUeguXK0QeHKR/56+I88X6
	EsM8/ClJYaHzkEaiMq7Kj4uMCBzJP+2mRSEO38z7SOqqcrP22Q9WQYA8pWlz
X-Gm-Gg: ASbGncv9HBOfJGQFD6uv1NTe2PbXrTqJivKVpmIIAo8GTeDzgGl7ykujy5oTtIUNw9G
	aUalrD+9X8gjLT5SXyLTmBpH2WehxBCfcoXfA18ckEXP984I53OvqIRBHbpbjCJiXCQWlTWpQVi
	b2IaSTgkrSdkLXw+ZTYd7VhLw4VpU8gbfmCGz/DrlauFTM5mknr+8huQQWYTLBPKUa+cIu7b+4e
	6aKOvtCM2p6JBdnHW8fqljFOKxune+JhTmzxhVQBS+T3weP/ZDrcIKMJYwBfG1HiSGR37huprvx
	Uc8QE9HESVX8BaxdpwecEbmywvlQm7APtWFXkJ+KlL1NhQ6AefbDPMPPz+0d4IHLXAvNnMA+wRp
	Q2hDxJU89I9EjiwEdMb1q+HVq+4WVb9q+7ztNmjLwPHnyPxquvyWNDjk8IiFlRWVTyy3TtL1rDA
	T1
X-Google-Smtp-Source: AGHT+IHBzIHEN9l/CBtIGO8A9FY0mPeDeUocBNhJ8d9ZJEncLbFH9u2dbsUeMjr3I6tl1CSW8tGLBA==
X-Received: by 2002:a05:620a:191e:b0:7c5:4a63:be9f with SMTP id af79cd13be357-7c5ba18dfefmr2801436585a.34.1742989147257;
        Wed, 26 Mar 2025 04:39:07 -0700 (PDT)
Received: from 999bfe87-2923-4fee-b525-6e36f6f0406d.local (ec2-52-207-216-219.compute-1.amazonaws.com. [52.207.216.219])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92d629bsm752700285a.38.2025.03.26.04.39.06
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 04:39:06 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Message-ID: <999bfe87-2923-4fee-b525-6e36f6f0406d@gmail.com>
From: Sam K <samk.threatsecure@gmail.com>
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Subject: kernel.org
Content-Transfer-Encoding: quoted-printable
Date: Wed, 26 Mar 2025 11:39:06 +0000
MIME-Version: 1.0

Hi Team,

I was checking out kernel.org and spotted a few things that could=
 make your site a target for cyber attacks.

Do you have any kind of =
formal/informal bug bounty or reward program for researchers to find and =
report security issues? If so, please let me know, and I'd love to check =
out the specifics see how I can help.

If not, please let me know if =
you=E2=80=99re open to rewarding researchers for valid vulnerability =
reports at your discretion.

Cheers,
Sam
