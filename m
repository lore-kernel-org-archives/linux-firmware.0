Return-Path: <jwboyer@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219BEC3A5A7
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Dec 2022 14:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DDBF5C43470; Thu,  8 Dec 2022 14:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CAEC433B5
	for <linux-firmware@kernel.org>; Thu,  8 Dec 2022 14:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670508845;
	bh=4rJsf4dGMsDYmtee6uy2Q5z9t9zlOwn3Q372oeYvyhI=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=X4I/83rL4gL++1zRAH5SlWkPYyZ9ZQX3IvBlE1RT8GETrs8Y2UrzVyuX4qcm+JONk
	 NLm70EZgdnUApv3TcFdx2oiCznhjPWQmWLfSQZwNqlgTkVkuM1SwW5yuo7LYCq0Von
	 w+M9X26L9GZE0+OTwC2aQiXi62iFqLmaYSoWrPxxMNA7Pk7ggdfDFsrpdxsQ/fWivm
	 8J5Hkk68Zr+MgxBwXtOFOiDUfLZIyGOl49BW46ETQf13QjNMrq1BZy/qUrlSKYQTrb
	 aKIBsVwusrcC+zfPQnOk2ywD4sY/5b7iUaS9dVxFZo74z6aZQUlgxosxfR3WdY74BI
	 PU+2+ujI58PoA==
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-144b21f5e5fso1923934fac.12
        for <linux-firmware@kernel.org>; Thu, 08 Dec 2022 06:14:05 -0800 (PST)
X-Gm-Message-State: ANoB5plJgTEL0WTBN7eegYlViCWqeGp8RhngCbkD8zrzloZYSm0mYA5M
	BBBGW3oowhDv96XnK8SezQFpFH0ccE10GKuTOAs=
X-Google-Smtp-Source: AA0mqf5BP6OIdb5spkZWMKCELO8gguUPUvjurY1RWNTHlNnEeUNDoP9nzq0oMtCwn53nzm1MYRwPiU5TUaqCeeR7dv4=
X-Received: by 2002:a05:6870:4d10:b0:144:8a50:3186 with SMTP id
 pn16-20020a0568704d1000b001448a503186mr9823604oab.3.1670508844905; Thu, 08
 Dec 2022 06:14:04 -0800 (PST)
MIME-Version: 1.0
References: <20221207222101.370686-1-arend.vanspriel@broadcom.com>
 <CA+5PVA5RjnxrMjHT_dhN5M09zJFLLu3xk_Fu_eKupVYa50a5BA@mail.gmail.com> <b42f3ebc-76db-01c3-37ca-aaa8a959bf48@broadcom.com>
In-Reply-To: <b42f3ebc-76db-01c3-37ca-aaa8a959bf48@broadcom.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 8 Dec 2022 09:13:54 -0500
X-Gmail-Original-Message-ID: <CA+5PVA59q1BcfUqeEEprpLQ-HVuvYrA7J_zs+v3hb0kYebgntQ@mail.gmail.com>
Message-ID: <CA+5PVA59q1BcfUqeEEprpLQ-HVuvYrA7J_zs+v3hb0kYebgntQ@mail.gmail.com>
Subject: Re: [PATCH] brcm: add/update firmware files for brcmfmac driver
To: Arend van Spriel <arend.vanspriel@broadcom.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 8, 2022 at 8:21 AM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 12/8/2022 2:01 PM, Josh Boyer wrote:
> > This is a combined version of the 8 patch series you sent separately, correct?
> >
> > Do you have a preference for which gets applied?
>
> Not really. This one bounced on the linux-wireless list because of its
> size so I sent the split series as there were some people interested in
> giving the firmware a run for its money (it is actually free ;-) ).

OK, I merged and pushed the combined patch out.  Thanks!

josh

> > On Wed, Dec 7, 2022 at 5:25 PM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> Updating a number of firmware files and adding some that are
> >> already supported by the driver for some time.
> >>
> >> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> >> ---
