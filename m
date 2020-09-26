Return-Path: <SRS0=dNzK=DD=gmail.com=pbrobinson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B93C2D0A8
	for <linux-firmware@archiver.kernel.org>; Sat, 26 Sep 2020 09:30:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A6EA0238E2; Sat, 26 Sep 2020 09:30:21 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23D0C2389E
	for <linux-firmware@kernel.org>; Sat, 26 Sep 2020 09:30:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o6MfolYW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23D0C2389E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=pbrobinson@gmail.com
Received: by mail-ed1-f49.google.com with SMTP id w1so4987785edr.3
        for <linux-firmware@kernel.org>; Sat, 26 Sep 2020 02:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5xC+2Pf5FN+cJcY8oR2Vevr6+Zn2e54AmcpD7/nnJSc=;
        b=o6MfolYWfxLAt1c+CdRqQvRDoYnjKwAtAMxy/wglR+wz/j6hYDsYABYAx277W9vqHs
         saQkBHzFMzn0rBHLg/5L4Sn7fxbrgeeir93umjvFbziO/iaQH/uj4viWMusslU3dum9O
         9jrfmsXGnkq9uYYave1qkddVrlU70Ia8qvGUm2eT7/9Y7moGcxyeQSTX9wZYA8TME1Me
         r6GMxKKG420/M0G4dKwn3zumwkPtXxfJ4+7/x/HBPOndOfyp8AO736sWSya4ef/kpzYr
         /biRn/XH+2glMCrUNxtbLlz0/ddVUSHazxPfd34sfyLtSEQjMdN8o99BjjCfNPspmF87
         7szw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=5xC+2Pf5FN+cJcY8oR2Vevr6+Zn2e54AmcpD7/nnJSc=;
        b=k5ygXnPd9P2uHssepI52Xd8J7qWRIaOUy0YzYSCVky0Zxtuyta/ErUIbO0nhpdOTXv
         3DFm52/UrNdybVgCVcJ800RFZ48yxrNxTzTvkyvXkqiOXMOKMFvjIMkNG7vpe0B/IJqf
         HM/Kt5prqp85AsWtUTv5p8dFtjlUR/J45pPfsoAQQB2oOtcU8MI2aIks3SRmTDGeU3Tv
         YVCZMe+blA+iEFsMAgJq70bDOX29sfvDa2bVyOqYSNiRcApf88C4sdcAbPnduqMgAuMm
         rkrmhRGt0E3i3VoBRrNLd73X5mY8OspYuDGCcgCpvUTcLMIbZKcVdXYIdDeg2NALrMV/
         RhWg==
X-Gm-Message-State: AOAM532+x8mAsJzOTTL7btZqVf4A8wjtEKEYhHw4+4u0Wyh3hxobt6U8
	baao9mxGJH1wwqrKUvHBS7QPmCq9QrldFrxoU0iT+dGbF3c=
X-Google-Smtp-Source: ABdhPJxjtcYbiw0IaFIaDKRDQyN7TjZJdYceglTOdj2rWwYn1OR2RPu82+HG2eAGqLF1ymh7oCeQPTEDfxGlV9tCWX4=
X-Received: by 2002:a50:e79c:: with SMTP id b28mr5889200edn.371.1601112619570;
 Sat, 26 Sep 2020 02:30:19 -0700 (PDT)
MIME-Version: 1.0
From: Peter Robinson <pbrobinson@gmail.com>
Date: Sat, 26 Sep 2020 10:30:08 +0100
Message-ID: <CALeDE9Ok=zrX9J6bksssgKND-Xn+KmYYHR1Vs97J6BRc6AQBwA@mail.gmail.com>
Subject: Status of cyprus/brcm firmware in linux-firmware
To: Christopher Rumpf <Christopher.Rumpf@cypress.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-firmware@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christopher,

Back in March [1] you said that Cyprus would work on updating the
firmware for the Cyprus WiFi for CVE-2019-15126 and improve the
upstream support in linux-firmware with a "worldwide generic embedded
CLM=E2=80=9D so that the generic users of upstream support at lead have
working/secure WiFi even if it's not the most performant. It was
indicated that this would be complete around June.

With it being almost October I'm wondering if you could provide and
update as to where Cyprus is on this?

Regards,
Peter

[1] https://lore.kernel.org/linux-firmware/20200319124147.PyvqXnAWOQd-eZgqj=
3j_fmqnpRT_AjpSLRWPDAsyOPQ@z/T/#t
