Return-Path: <SRS0=NctW=6B=gmail.com=alexdeucher@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8AEC2D0EF
	for <linux-firmware@archiver.kernel.org>; Fri, 17 Apr 2020 17:16:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 30671208E4; Fri, 17 Apr 2020 17:16:58 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72F82078E;
	Fri, 17 Apr 2020 17:16:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU/q/la9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72F82078E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=alexdeucher@gmail.com
Received: by mail-wm1-f42.google.com with SMTP id a81so3793196wmf.5;
        Fri, 17 Apr 2020 10:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VldSqv4fva6EX7nPXI2uI55Yl59rO2DU7GwN4HHPw9c=;
        b=EU/q/la9Ulz4BEk5u+hxAo0Qp2nBmEO7U3rqqAFY0atp+JQomidi11phv9q9e3R9jw
         Vbt7NQA+k8AlJw7F0GP6Ry0fx8dE7AYehi6JJI6GZ6zZofm5cKGdSZ95aBLUArOmAFvs
         QBImmxi+WjG6FBnEFkP5dIyRBOhE1LjB/FgiBfkJAxhU12QX0F/YtCG6eMZWYFzygMKQ
         cXOiMiKmeTVedRKkS57BOLTFzQ9J/pPcpdBgcGkkaKfEXIZmUUpdsthqQKmLQ94S07Xl
         O1wWdu+FjXCXvsPGu+drcis1Ot6B3Q5D7lgEjmK5VW2EMgOgxGRXsjUZztb8z/Q3FcYI
         XrUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VldSqv4fva6EX7nPXI2uI55Yl59rO2DU7GwN4HHPw9c=;
        b=PclypHdUq1M/RE7whnKc3hIrirrs+7ofe/GX6i8h/1q+14L1cJ1fCSfzP53Y9RJWHs
         KoJ4+/Owi4WY1FYytcuAypRl/tR94l/7zeBKcXpDgHzD9YewKu1M7AEO81frYwq1fZGL
         APYPW7e+QpQDMYIUy8AYpch1Wws0SCeMGXbEiGNNTcQVecBoW0y9xmvAcE6E5ddSO8xu
         55IldLDBWJfjdhYzie3lSRp0QHPBA7IDsBxXxBkfI1awGrsw/KNPAmxK+9yzu8a+S5hZ
         CV3rhffPaWv5zeHgWA6+54W/uKSHos+SRuGyuh2/L5BlhL5yvG5maYtsTdpARpVAeouA
         rhGw==
X-Gm-Message-State: AGi0PubP65vYKiDgvRxyQhwqrgmjP4XpI4bOpf52+ugEGPYii8+oERN1
	z8H8zi5FtLuUM9OOYvciA+n3n6r/NEVLW1Y72jJWsw==
X-Google-Smtp-Source: APiQypJaiFoQWL/UR9F2+zzKAJm2qi5n0Kd8ijpzxNfYe55hva6p6i1BPD+DrtlaJd4NscWtI4esXFxfFkl6Ol/bXxE=
X-Received: by 2002:a1c:9d8c:: with SMTP id g134mr4505981wme.79.1587143816091;
 Fri, 17 Apr 2020 10:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_Pm_HJSM4Op1zyYUvoK2VN5=+ZnrkwqtYZPGOwiDjasPA@mail.gmail.com>
 <CA+5PVA71rohy0emh+aJCs80M5C30sn7A_gcKierCd2ASdf0GAQ@mail.gmail.com>
In-Reply-To: <CA+5PVA71rohy0emh+aJCs80M5C30sn7A_gcKierCd2ASdf0GAQ@mail.gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 17 Apr 2020 13:16:44 -0400
Message-ID: <CADnq5_OsJCqfjgrRpVO=2q+ruyCeZTTEPdcJUZ_AKzbYCKAWCQ@mail.gmail.com>
Subject: Re: amdgpu firmware updates
To: Josh Boyer <jwboyer@kernel.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Linux Firmware <linux-firmware@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Fri, Apr 17, 2020 at 11:27 AM Josh Boyer <jwboyer@kernel.org> wrote:
>
> On Thu, Apr 16, 2020 at 4:12 PM Alex Deucher <alexdeucher@gmail.com> wrote:
> >
> > Updated amdgpu firmware for 20.10.  Please apply!
>
> Applied and pushed out.
>
> josh
>
> >
> > Thanks,
> >
> > Alex
