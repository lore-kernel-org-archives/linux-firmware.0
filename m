Return-Path: <SRS0=eOPl=DD=gmail.com=yangsunyun1993@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFDCCD3436
	for <linux-firmware@archiver.kernel.org>; Wed,  6 May 2026 11:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02E33C2BCC9; Wed,  6 May 2026 11:56:03 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4EB65C2BCB8
	for <linux-firmware@kernel.org>; Wed,  6 May 2026 11:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4EB65C2BCB8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6948fb494a0so3500933eaf.2
        for <linux-firmware@kernel.org>; Wed, 06 May 2026 04:56:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778068561; cv=none;
        d=google.com; s=arc-20240605;
        b=luMyILmtrVKOcliVVtENZDCG8m9RWdSbNuz95tDODkDzPVfJwaavDlQvyZYW45stvz
         UxHqPMT9o1gBFBjukZwEMaggd8KdPT9cL2ujG+4RNOaKUAL4wV4CgOhFcDsrgGXC5qAZ
         g0JmQfeHmLEkYKt45M3yiwUBLqoS5p51Ffcf5cPCQbUDnd74WJOl/QU0GLW4MF2LAoB0
         XuAA/KshKIjMErfafZi43suUcAhfsGkN8hDG9g+p+dlAKIp5JbVjmGeR84RgGydOC7hC
         lEYFSwPu87d4jidLxsaYtLGUs9/00cGTttHpOjZ8XLNbx8GnKBWLYUUOSwGJa//PEv7E
         +gQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sScAUkvpT+ZfAj/Yc+LISbwiZTaTBV25HSspOu/fMkY=;
        fh=yvkpTjQPYOXQ3CRpr+mhReNLc+hfcyGwjNqUecLQRzU=;
        b=GwNJbVaI0sLC5jIK78z/AVP6sy3grnYAcKcTfnsIg+mOJChS687CsJ2XEf/nRao0HX
         GzuGZRyVy8joSLaHZl3kwBvwfXBreXl0xAUfrN4YRcT+G1NVNn59ETf6WP9b/+0U2zeU
         eoqO7zYg2wdUGSBZqOLZ3huRI8JLLJeiJdciv83FF0HL5Da8R7RGgksD7whygvAQkgIG
         eJ6kOoYMMIVBGKZPVyXGm3R3++x4aPZ3IQKiwEodbsx3dOvAQY/q5GLwN3MSF7o0FYsp
         /wyOd/fn6QlYik3mEwrN3O0cJcvPllUPjtmev90QwPMoPMHN5aM0e0KptLQNWJcwNRbT
         6RVg==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778068561; x=1778673361; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sScAUkvpT+ZfAj/Yc+LISbwiZTaTBV25HSspOu/fMkY=;
        b=FpXxFARXIkC9GuXAe6pxXVQKen+y43DfePHal2ogERhJiZ+x+3qmdyL3OctPxQ8Vcf
         IjqV6eW+xMRxecJu/Nd240WJej4VosWJS4sQWYi0gLMyfcfvKl82XE7IgUxcaRTonnKw
         Dv4pyRqVdSTwKY5q2VOmFPNUSWow9vr6jCWonzQjRoCf2tRC2PmOsPPT6lYtI+n7Do/9
         TLj+rnv43kNIS4OfEAbLDCfZuKnANKiFvLjyScfBC0iAUB+x68qBw5VrPgqt87Lyh8Cl
         r84DteGzpkTcN9oyWNhzMy8frIwy3/q/UIGm9nAXUp5cw8HqQuMPss5Xu8qvR23lx4Jz
         rI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068561; x=1778673361;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sScAUkvpT+ZfAj/Yc+LISbwiZTaTBV25HSspOu/fMkY=;
        b=UtS+uM+Cyg3f214squ7/jv4MRYILegmA6t/MG6ZtxM2HBD55k+Y4lxLjinRGUwnj53
         /EHKGYoAv9XjpJMAGZlAK7hThYnCQOR0ubJJpjF54eLpDY6vhccjyh84osExdvulx0xl
         W8tVVjjfWrKHkeXR6pbVbzn5fFNkVC3pxCsQeVaIdU7WX7O8p3PAJj6zTAUditD/UHfj
         UDOIoML8ASO3fjZXyoNLdd8vKaob/G6aWyYV9q7AivbzC7L4/M5ePVWCU5QpCVMSqZou
         TCvg9ot+aHgKVJ1lYHxETNbeBWiNhLTZaVUm1elvG5V0sKIBLIFmMw/mdVnCQM4mL/KA
         CsUg==
X-Forwarded-Encrypted: i=1; AFNElJ9IptL/KkiivMQYJkPqr4crifyrnMaVlpoJkne/F6zJwhcHVABoLsVp8ZMdgrAjwyEIrM7WGth92Be8qJvhmA==@kernel.org
X-Gm-Message-State: AOJu0Yz2VB0NW2Si1sljB0XFF3zu8hIXsSFqRoNplfHbpOdr7EJxyRCs
	dZmsMIbLqWLIdjGr6OrJm12s5xfwD9KNle8pYLEp6pIDI9vgHpF2jOs2V3uugoI1cLkR+cOYj2V
	dm4FD5TDCHI0lg6eXr7/JiZ3dliEVSW//srqi
X-Gm-Gg: AeBDietCl8RyQ2JWOENuuggf/V6YzYqDTmf5zWyaATSzXIcYGNJUS3I0oyOXm5F4QVq
	MXlgYRAo2ZT6MVpQXc0VHn5JzbUu7kFrGFPVmZjK5Y+Yxrf7PzNnk5jRpVRvM3awGI/CipkTJrY
	TykIXbjF94ZWCrPCeB7pK9SPkXZs2vlM+juDbRRb91/IiQxBAza2iWvOa7UdOW9GKAjE8qwNcPb
	ib47ioA4ZldLKqcx1GEglhdmWuW6rVjh1lyvS7/cWe0IQ8kFcj6ElXU7nxiEEcl3vjAWNWcJm9a
	1eUCjxnDvDCgF8bSXw==
X-Received: by 2002:a4a:ee87:0:b0:696:72c4:5d69 with SMTP id
 006d021491bc7-69998cca765mr1333975eaf.17.1778068561215; Wed, 06 May 2026
 04:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260506104934.82275-1-syyang@lontium.com> <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
In-Reply-To: <CAO9ioeVBF2O9sRT+KzMETvYuV5Jw0okj6MiM1sxVdc5j8Pdk3w@mail.gmail.com>
From: =?UTF-8?B?5p2o5a2Z6L+Q?= <yangsunyun1993@gmail.com>
Date: Wed, 6 May 2026 19:55:49 +0800
X-Gm-Features: AVHnY4IYbJDIh0oDFlZ9ZFH51JUF-DWZ_JPR01i2FtwMuUV_KMEmNwTNJpNLh4E
Message-ID: <CAFQXuNbA-wW-ZyqZKjRagA+qpPMP7AAtaX67Y4=AHOx23s2SEg@mail.gmail.com>
Subject: Re: [PATCH v2] linux-firmware: Add firmware for Lontium LT9611C
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: syyang@lontium.com, linux-firmware@kernel.org, 
	xmzhu@lontium.corp-partner.google.com, xmzhu@lontium.com, rlyu@lontium.com, 
	xbpeng@lontium.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
5=E6=9C=886=E6=97=A5=E5=91=A8=E4=B8=89 19:46=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 6 May 2026 at 13:49, <syyang@lontium.com> wrote:
> >
> > From: Sunyun Yang <syyang@lontium.com>
> >
> > This is the firmware for the Lontium LT9611C,
> > which implements the function of converting MIPI DSI to HDMI.
> >
> > Signed-off-by: Sunyun Yang <syyang@lontium.com>
> > ---
> > Change in v2:
> > - WHENCE
> >  1. Modify lt9611c_fw.bin to Lontium/lt9611c_fw.bin in the WHENCE file.
> > - Link to v1: https://lore.kernel.org/all/20260506100242.79276-1-syyang=
@lontium.com/
>
> Why? The rest of the Lontium firmware is in the root directory. The
> driver also (IIRC) expects the firmware in the root firmware
> directory.
>

Our intention is to place all Lontium firmware in the Lontium/
directory for the following reasons:

1. To distinguish them from other companies' firmware files=EF=BC=8Csuch as
rockchip, qcom.

2. To keep the root directory cleaner and more organized.

>
>
> --
> With best wishes
> Dmitry
