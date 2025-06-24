Return-Path: <SRS0=6NuG=ZH=gmail.com=slark.xiao@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204FDC77B7C
	for <linux-firmware@archiver.kernel.org>; Tue, 24 Jun 2025 06:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E28AEC4CEF1; Tue, 24 Jun 2025 06:10:00 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4F25C4CEEF;
	Tue, 24 Jun 2025 06:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4F25C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ae0b2ead33cso8035566b.0;
        Mon, 23 Jun 2025 23:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750745398; x=1751350198; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V1weJe0wD8IwYDITJHtD9If3dtQxSOTgLHJVYGnYhTU=;
        b=j1tbDkhQMFxCeuxlklnVtRhBo0orf0ug7fz98jvqAcrvzijvr2XSImgv9wMreLzotq
         s2lebR/X0QHlJN02tTNbBKQoBiPW9QEOxTJE2X0CABAoESBDytzNzmyjyQ5/ROdC4UAI
         zPGqdvCUIh6rIv6KhUyxUuAUi21QipyLWyGDxtJxz4SSymoj33dHagV2bVwULSYQx/3T
         7PchDtPuT8DMoe6p2oxFW/xvYMS+2Ya4S1sgUcXo1seVxROW0hMydits291tz2sIXOxd
         mnkZzMFFEZSMpxsMxXHgRlFm8+Qd66Po236t5s1VGYbiEkSfzB/OeRKLk1kLwMYc3g3p
         RZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745398; x=1751350198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V1weJe0wD8IwYDITJHtD9If3dtQxSOTgLHJVYGnYhTU=;
        b=e2U6bhbUBQDPqjSAXotkYNpYprVi6cxhRKVQl0pbQfSPbVVAI69ir2DJly/LARiw5G
         uutu6lLlT1W04e1hMPRtYNjNMACpzaYZuvwDPMUH3NXr9mMSBSd51Die8EsgyUUaeT1G
         K2d6hBxql2/RAoSQZB9StbJ5xgWOSNqCX4/U1eR0ytPvOuNp3a+7x9BBMOSLLk0NQpS6
         mLTRJsF9iMyVYacsvaRTgMBLx2pEQGLF3uAGFi4jK2+4DEOIddWveRkHQwI5Vo5W4Brt
         umqjIdEvhyfTxAtRKIjDuLTl6/v3JjaciCZcN1GnaghjAgn14w5w0fGK1GbyFDwBLqQj
         w8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCWIm2Qr/xoknVWxj9XI4rxMByNIhxZYDlyttF2i77Y1j3L0Ei70+/ZatRZUfWBJ7rZxFZlGp17SkuuWW8wYqA==@kernel.org, AJvYcCWM8ow4uMsEnyPnQvheHsDOqx9Wff1bg+W6G3rzmeSutrXj8WQ2lzNivyzv3CVOrkpaqHiP7w==@kernel.org
X-Gm-Message-State: AOJu0YxjGg0VEQTsLTjDlACDuVi6LvTjt6NrJNhwKNL3RHJM1dZPCujj
	xSTzyqj0YIZZzvXz0jRF6tPpkpADET74drc9TKlgiGN90Ig/wHv30vwFv5+wY3IrqnVPD2hJoXM
	jgUPY88GNQPC0L1XrSl+1sbpPK2QBxFo6b+tHaxCDSxbqmOw=
X-Gm-Gg: ASbGnctwWr2sj5x81499EmRmBia6jUgPdV1tirOBdCxNhDJFZ2Q2JAhhkADc0uA3eh5
	PY+ZVfc7W2yvZc4vpZMyd4Ap70dlTCIMz0GDEOMdYEc6iPKGtsFaIMQOpRwCOnbFz61yvvQ1mDn
	cAytABTekt4KnFs1vY93WfTtqQMYPLkOoNognnrU85LfG+
X-Google-Smtp-Source: AGHT+IEv0kvegRuv7Q39pfxFmkekbFBAJ0mUi+wDyf7sS7YF2oUvXaNDCvysFbrEtvZUalw6YMQ5IxRN7e4oLm59iVQ=
X-Received: by 2002:a17:907:3d52:b0:ad8:adf3:7d6d with SMTP id
 a640c23a62f3a-ae0a73f5993mr192655866b.21.1750745397593; Mon, 23 Jun 2025
 23:09:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250623115444.12870-1-slark.xiao@gmail.com> <xlredaznmv2li7vs4vi5dze65d5fhbff4tvvsjcraltmrs7jx7@vdj4n3u2zu5f>
 <CA+5PVA5CuoMv3rTxb=StPWxf2T8KcQjvgJG_1duHG7f8gWuf6Q@mail.gmail.com>
 <6733b4ea-c682-4a0c-b166-d6e9a3bb4e6a@oss.qualcomm.com> <CA+5PVA516=cSSZZTAZT9Zvx6J=AuOJutVN4Zd9hu4OEZEVuMoA@mail.gmail.com>
 <yzxrb2v2eot2mzftr6zjizp62nijs2bu2qjc3p7lpmfp6hmauz@4eizsg5azl43>
In-Reply-To: <yzxrb2v2eot2mzftr6zjizp62nijs2bu2qjc3p7lpmfp6hmauz@4eizsg5azl43>
From: liyun xiao <slark.xiao@gmail.com>
Date: Tue, 24 Jun 2025 14:09:47 +0800
X-Gm-Features: Ac12FXwSXncsyTvUTgiQhvNnkFU7COMXJz2GBgauCG-UI9x0K9HIvGmoOHpgeag
Message-ID: <CAHFGUf7FcNpCm_389v7Qs7CcDt6fHQAaXTJFC2LO2yDPsmOtpQ@mail.gmail.com>
Subject: Re: [PATCH] qcom: Add sdx61 Foxconn vendor firmware image file
List-Id: <linux-firmware.lore.kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-firmware@kernel.org, 
	li-yun.xiao@fii-foxconn.com, mani@kernel.org
Cc: Josh Boyer <jwboyer@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000840ca706384b2daa"

--000000000000840ca706384b2daa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,
Thanks for this suggestion.
@mani could help confirm this since he is now working in Qualcomm
and he is the maintainer of MHI driver as well.
And also, I will forward this email to my company's address
li-yun.xiao@fii-foxconn.com. That account would confirm this.

Thanks

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
6=E6=9C=8824=E6=97=A5=E5=91=A8=E4=BA=8C 06:41=E5=86=99=E9=81=93=EF=BC=9A

> On Mon, Jun 23, 2025 at 12:00:40PM -0400, Josh Boyer wrote:
> > On Mon, Jun 23, 2025 at 9:55=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > >
> > > On 23/06/2025 16:50, Josh Boyer wrote:
> > > > On Mon, Jun 23, 2025 at 9:42=E2=80=AFAM Dmitry Baryshkov
> > > > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > > >>
> > > >> On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wrote:
> > > >>> For MHI modems, it defines an edl firmware in kernel drivers/bus/
> > > >>> mhi/host/pci_generic.c file. According to the requirement of MHI
> > > >>> driver maintainer, we shall commit this firmware before commiting
> > > >>> kernel driver support.
> > > >>> Since different vendor use different firmwares, so we add a
> > > >>> vendor sub-folder under qcom/sdx61.
> > > >>>
> > > >>> Signed-off-by: Slark Xiao <slark.xiao@gmail.com>
> > > >>> ---
> > > >>>   WHENCE                                    |   7 +++++++
> > > >>>   qcom/sdx61/foxconn/prog_firehose_lite.elf | Bin 0 -> 663552 byt=
es
> > > >>>   2 files changed, 7 insertions(+)
> > > >>>   create mode 100644 qcom/sdx61/foxconn/prog_firehose_lite.elf
> > > >>>
> > > >>
> > > >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > >
> > > > I'm sorry, but I have no indication the submitter has the authority
> to
> > > > submit this firmware.  It's from a gmail address.  Is your Ack
> > > > implying Qualcomm is agreeing to submit this firmware?
> > >
> > > No, I can not validate the submitter too. It's more about the filenam=
e
> > > hierarchy. I'm sorry for the confusion.
> >
> > Thank you for clarifying.
> >
> > Slark, given we can't identify this was supposed to be released and
> > licensed under the Qualcomm license from your email address alone, we
> > can't merge this.  We have no idea what the provenance of this
> > firmware is.
> >
> > Can you work with someone in Qualcomm to acknowledge this came from
> > them and it's licensed appropriately by sending the firmware or at
> > least an Ack from a qualcomm email address?
>
> I'd say, Qualcomm or Foxconn.
>
> --
> With best wishes
> Dmitry
>

--000000000000840ca706384b2daa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi all,</div><div>Thanks for this suggestion.</div><d=
iv>@mani could help confirm this since he is now working in Qualcomm</div><=
div>and he is the maintainer of MHI driver as well.</div><div>And also, I w=
ill forward this email to my company&#39;s address</div><div><a href=3D"mai=
lto:li-yun.xiao@fii-foxconn.com">li-yun.xiao@fii-foxconn.com</a>. That acco=
unt would confirm this.<br></div><div><br></div><div>Thanks<br></div></div>=
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.baryshkov@oss=
.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com</a>&gt; =E4=BA=8E2025=E5=
=B9=B46=E6=9C=8824=E6=97=A5=E5=91=A8=E4=BA=8C 06:41=E5=86=99=E9=81=93=EF=BC=
=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, Jun =
23, 2025 at 12:00:40PM -0400, Josh Boyer wrote:<br>
&gt; On Mon, Jun 23, 2025 at 9:55=E2=80=AFAM Dmitry Baryshkov<br>
&gt; &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com" target=3D"_bl=
ank">dmitry.baryshkov@oss.qualcomm.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 23/06/2025 16:50, Josh Boyer wrote:<br>
&gt; &gt; &gt; On Mon, Jun 23, 2025 at 9:42=E2=80=AFAM Dmitry Baryshkov<br>
&gt; &gt; &gt; &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com" tar=
get=3D"_blank">dmitry.baryshkov@oss.qualcomm.com</a>&gt; wrote:<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; On Mon, Jun 23, 2025 at 07:54:44PM +0800, Slark Xiao wro=
te:<br>
&gt; &gt; &gt;&gt;&gt; For MHI modems, it defines an edl firmware in kernel=
 drivers/bus/<br>
&gt; &gt; &gt;&gt;&gt; mhi/host/pci_generic.c file. According to the requir=
ement of MHI<br>
&gt; &gt; &gt;&gt;&gt; driver maintainer, we shall commit this firmware bef=
ore commiting<br>
&gt; &gt; &gt;&gt;&gt; kernel driver support.<br>
&gt; &gt; &gt;&gt;&gt; Since different vendor use different firmwares, so w=
e add a<br>
&gt; &gt; &gt;&gt;&gt; vendor sub-folder under qcom/sdx61.<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;&gt; Signed-off-by: Slark Xiao &lt;<a href=3D"mailto:slar=
k.xiao@gmail.com" target=3D"_blank">slark.xiao@gmail.com</a>&gt;<br>
&gt; &gt; &gt;&gt;&gt; ---<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0WHENCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +++++++<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0qcom/sdx61/foxconn/prog_firehose_lite.el=
f | Bin 0 -&gt; 663552 bytes<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A02 files changed, 7 insertions(+)<br>
&gt; &gt; &gt;&gt;&gt;=C2=A0 =C2=A0create mode 100644 qcom/sdx61/foxconn/pr=
og_firehose_lite.elf<br>
&gt; &gt; &gt;&gt;&gt;<br>
&gt; &gt; &gt;&gt;<br>
&gt; &gt; &gt;&gt; Acked-by: Dmitry Baryshkov &lt;<a href=3D"mailto:dmitry.=
baryshkov@oss.qualcomm.com" target=3D"_blank">dmitry.baryshkov@oss.qualcomm=
.com</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I&#39;m sorry, but I have no indication the submitter has th=
e authority to<br>
&gt; &gt; &gt; submit this firmware.=C2=A0 It&#39;s from a gmail address.=
=C2=A0 Is your Ack<br>
&gt; &gt; &gt; implying Qualcomm is agreeing to submit this firmware?<br>
&gt; &gt;<br>
&gt; &gt; No, I can not validate the submitter too. It&#39;s more about the=
 filename<br>
&gt; &gt; hierarchy. I&#39;m sorry for the confusion.<br>
&gt; <br>
&gt; Thank you for clarifying.<br>
&gt; <br>
&gt; Slark, given we can&#39;t identify this was supposed to be released an=
d<br>
&gt; licensed under the Qualcomm license from your email address alone, we<=
br>
&gt; can&#39;t merge this.=C2=A0 We have no idea what the provenance of thi=
s<br>
&gt; firmware is.<br>
&gt; <br>
&gt; Can you work with someone in Qualcomm to acknowledge this came from<br=
>
&gt; them and it&#39;s licensed appropriately by sending the firmware or at=
<br>
&gt; least an Ack from a qualcomm email address?<br>
<br>
I&#39;d say, Qualcomm or Foxconn.<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div>

--000000000000840ca706384b2daa--
