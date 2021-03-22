Return-Path: <SRS0=d+0F=IU=raspberrypi.com=phil@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51999C433C1
	for <linux-firmware@archiver.kernel.org>; Mon, 22 Mar 2021 21:29:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 23CDD619A3; Mon, 22 Mar 2021 21:29:58 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2E86196C
	for <linux-firmware@kernel.org>; Mon, 22 Mar 2021 21:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2E86196C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=raspberrypi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=phil@raspberrypi.com
Received: by mail-oi1-f180.google.com with SMTP id l79so14670742oib.1
        for <linux-firmware@kernel.org>; Mon, 22 Mar 2021 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kNOykMmg4cnW1A03xDwi/pbUamZ2+zCFKGu5yDlNOTU=;
        b=Ba7jIixxRO5rCxlKwoC7bZ4690aVN6N1GG1ST3Cv7q862Z+mPBm20zD9ytbUNLu2JW
         EvXydDHOAVLruYhVg/Hn2fe7Z1YFLaQ6wCJIdms+HvGMBTvewAQ7tMHyWosuv6WWr6E+
         JlomTND0kcNtGkpV6ALhwF1QLyC1t8ZKAjT9Qeo/pPHWtXmyAS07UTktP/PjE2yFlrW9
         lRGw7r+6YlOIa3BrPzPdXejCn1td9J3v+ja2boF2ckTLh4gGYkrlA33/k55Nm5D52AC+
         s6SaeVE1Jux5CnKKR4Nby14TdwSR1Fr3+z5FPLt+P0gHSVt3lbVm0S92jxjHmXwyogXM
         IVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kNOykMmg4cnW1A03xDwi/pbUamZ2+zCFKGu5yDlNOTU=;
        b=mpmIOkyeZdKsmVlyFg0H7X1SwGqY+nGNRkgLyg7rAqWDaud6L7iPPrja+hnXyHpd1N
         hGgCoAtNtX3Bx31uOUNmaNhAHJlFOilCW7HyM64v+M4ZNHvDtOIlz5KOwLaJ87u3QOfH
         ebmECCLsKJiTC7S0TxdtlWdQ2OIYFqipe50tNUsPdzrIvcvxFghgMOXZqtumoFPqI6/o
         /BNekqxat3NYLoBxZB3voP/ddAVMiXcmKUArpHTh+Z2kV0TcizPakbbWS1Te8iYEMI3C
         4TFqJrfX8qk0tUaKkf1BZ4GaD6JfL6hyEX9W9QznuRp0hV2khfwpMRimKKkgoWLXc7Lf
         65NQ==
X-Gm-Message-State: AOAM531nMvjHz7z/wxtI1h3hP4oVbW2NZgYhgipZ/UtenUfgjcVosdY0
	pG0lGExs7EjLEo5WPLOfU2FBcbM9hVMwZG1/naUO6NYOAlI=
X-Google-Smtp-Source: ABdhPJzFEeYVzOGK4ivf9rWFkRwGx1+puzGPdXGwpxZnCjnb7lHACVFOMI1iW2PTvMHj5KUNp06ojbkNeQy2gPIx7h0=
X-Received: by 2002:aca:5845:: with SMTP id m66mr845678oib.0.1616448597090;
 Mon, 22 Mar 2021 14:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <YFkFQ9+dFc/mM/Sq@photino.stro.at>
In-Reply-To: <YFkFQ9+dFc/mM/Sq@photino.stro.at>
From: Phil Elwell <phil@raspberrypi.com>
Date: Mon, 22 Mar 2021 21:29:48 +0000
Message-ID: <CAMEGJJ0-ZccyOw6HUoJabUxgxh6CnYf2qnUfKX7O5YW_xx7zhA@mail.gmail.com>
Subject: Re: RPi 4B wireless firmware update?
To: maximilian attems <maks@stro.at>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Linux Firmware <linux-firmware@kernel.org>
Content-Type: multipart/alternative; boundary="0000000000006d748d05be26c4ca"

--0000000000006d748d05be26c4ca
Content-Type: text/plain; charset="UTF-8"

Maximilian,

The Cypress firmware in our repo has been tailored to our platforms. I believe
it is up to the creators to decide whether or not to upload firmware to the
canonical Linux firmware repo and, if so, which and how many variants.

Phil

On Mon, 22 Mar 2021, 20:59 maximilian attems, <maks@stro.at> wrote:

> Dear Phil, dear Chi-Hsien,
>
> It seems that there is a new firmware [1] distributed for the CYW43455
> since creation of the cypress directory in linux-firmware git:
> [1]
>
> https://github.com/RPi-Distro/firmware-nonfree/commit/f713a6054746bc61ece1c8696dce91a7b7e22dd9#diff-1ddd585d9cadb82dd8e346a46cc6b76ad5ffa1d64b2c79c855062fd863d37f99
>
> Where is this version to be downloadable at cypress/infineon and
> is it distributable as the previous version?
> If it is could it be submitted to upstream linux-firmware?
>
> thank you.
>
>

--0000000000006d748d05be26c4ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Maximilian,<div dir=3D"auto"><br></div><div dir=3D"auto">=
<span style=3D"font-family:sans-serif">The Cypress firmware in our repo has=
 been tailored to our platforms. I</span>=C2=A0believe it is up to the crea=
tors to decide whether or not to upload firmware to the canonical Linux fir=
mware repo and, if so, which and how many variants.</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Phil</div></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 22 Mar 2021, 20:59 maximilian=
 attems, &lt;<a href=3D"mailto:maks@stro.at">maks@stro.at</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Dear Phil, dear Chi-Hsien,<br>
<br>
It seems that there is a new firmware [1] distributed for the CYW43455<br>
since creation of the cypress directory in linux-firmware git:<br>
[1]<br>
<a href=3D"https://github.com/RPi-Distro/firmware-nonfree/commit/f713a60547=
46bc61ece1c8696dce91a7b7e22dd9#diff-1ddd585d9cadb82dd8e346a46cc6b76ad5ffa1d=
64b2c79c855062fd863d37f99" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://github.com/RPi-Distro/firmware-nonfree/commit/f713a6054746bc61ece1c=
8696dce91a7b7e22dd9#diff-1ddd585d9cadb82dd8e346a46cc6b76ad5ffa1d64b2c79c855=
062fd863d37f99</a><br>
<br>
Where is this version to be downloadable at cypress/infineon and<br>
is it distributable as the previous version?<br>
If it is could it be submitted to upstream linux-firmware?<br>
<br>
thank you.<br>
<br>
</blockquote></div>

--0000000000006d748d05be26c4ca--
