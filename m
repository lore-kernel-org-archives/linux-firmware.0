Return-Path: <SRS0=Pf8o=22=google.com=nhebert@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C27EFA373E
	for <linux-firmware@archiver.kernel.org>; Tue, 25 Oct 2022 21:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 08478C433B5; Tue, 25 Oct 2022 21:25:39 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B1FB4C433C1
	for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 21:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B1FB4C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-lj1-f182.google.com with SMTP id u2so9802073ljl.3
        for <linux-firmware@kernel.org>; Tue, 25 Oct 2022 14:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wHp77BN61/poy6Rdc+muqjnwKivifyShv/e4kbaWkbM=;
        b=miD7owArOaf//kjOROs4hZ+EA0DnmjJES0+gfnjZmCWDDae17zlmexkaREDf2Lhn8d
         uKdaxJDCc0x4ZfPBIU4aFAQpNNz1WO7a9Q7CpsXJaWlFc5PiODpmxb6xIXrrR1vf5yDX
         fGoR7qLR3YQvR9mlpJPo5N4/ZPUJgigaOpcjOnRtBX5iENShb+McsDj+CcxmFqJiKVNF
         mYeprJt+r6H03BW+pbTxrMty4h4ltwyy+IPG2+vlsYf6yN6+Gj9aAqOvWKgWbisO/xit
         w/EPJqTwYDpwAhm5mERcPGFX4PTLzaJvXGRX0oToviyoYxCQz9naFTKPhU+6RB2O6LeT
         G+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wHp77BN61/poy6Rdc+muqjnwKivifyShv/e4kbaWkbM=;
        b=tGeMW3vTO70xMTylpPmWzVP27AWrRchHBaeeH02SrfQeUwfgeVa/2nvHf4E7+L0Kya
         zQPkS12go/lrJuVE3ji4pEHnpgUPv5ixEWpva3ZEGsJ/58b8IjstMsIvsMBLGAFiQYk3
         0BMlfdk7gwtBuvm95VfpEQLe5taW/0ZvBLZ13+zfIstKCWIbpRIgNovhfZBAL2EGbgz0
         teNZawjSEFnV2TuZhHGy+TzNW12JShK777t4WSBbMAjk/S7l8Z3L4cyb5MLXIouTOA+6
         s10/5Y2k5azkNaWnCU0CF9RhlcK9rfRITUgRVABt9aJWWC80PSO1rI7FYMH4oWcIjWm1
         C7Dw==
X-Gm-Message-State: ACrzQf2utgxeW1wuHuPuv0LHbt6W4Efm1tQOqXjEin+IiO40dQpnyEJV
	MEgh2pZafN6ERjT4jmI8ub6hWO4DkRRbksfRND501Q==
X-Google-Smtp-Source: AMsMyM6J+HjJof2bwhK6gIaLCu4PKsrVxY1y13EtRWV0dlvp2JJrjkv5pHOgsLJ9GzDUubwsW9suflaQrOnuPVVbBEg=
X-Received: by 2002:a2e:9248:0:b0:277:5b:2212 with SMTP id v8-20020a2e9248000000b00277005b2212mr7940628ljg.299.1666733135558;
 Tue, 25 Oct 2022 14:25:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANHAJhGcJT3nEq_s7qb4ammtiyCe1SQko3yXx7_5nm4PoJg+=A@mail.gmail.com>
 <149c9604-03ad-3869-075c-7080d921deb6@linaro.org>
In-Reply-To: <149c9604-03ad-3869-075c-7080d921deb6@linaro.org>
From: Nathan Hebert <nhebert@google.com>
Date: Tue, 25 Oct 2022 14:25:24 -0700
Message-ID: <CAP2OJckXBrnFKDrE=yFXM=MwxAvZEQ8cnSCKtYXzTRWoa9FhOQ@mail.gmail.com>
Subject: Re: [PULL V3]: qcom: SC7180 and SC7280 venus firmware updates
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
List-Id: <linux-firmware.lore.kernel.org>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-firmware@kernel.org, 
	linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Vikash Garodia <vgarodia@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="0000000000007b8bc605ebe28ca7"

--0000000000007b8bc605ebe28ca7
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

On Tue, Oct 25, 2022 at 2:08 PM Dmitry Baryshkov <
dmitry.baryshkov@linaro.org> wrote:

> On 25/10/2022 23:54, Nathan Hebert wrote:
> > The following changes since commit
> 48407ffd7adb9511701547068b1e6f0956bd1c94:
> >
> >    cnm: update chips&media wave521c firmware. (2022-10-17 10:20:43 -0400)
> >
> > are available in the Git repository at:
> >
> >    https://github.com/nathan-google/linux-firmware.git
> > update_sc7180_and_sc7280_firmware_v3
> >
> > for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe0389131:
> >
> >    qcom: update venus firmware files for VPU-2.0 (2022-10-25 13:34:43
> -0700)
> >
> > ----------------------------------------------------------------
> > Nathan Hebert (4):
> >        qcom: replace split SC7180 venus firmware images with symlink
> >        qcom: update venus firmware file for v5.4
> >        qcom: remove split SC7280 venus firmware images
> >        qcom: update venus firmware files for VPU-2.0
> >
> >   WHENCE                   |  24 +++---------------------
> >   qcom/venus-5.4/venus.b00 | Bin 212 -> 0 bytes
> >   qcom/venus-5.4/venus.b01 | Bin 6808 -> 0 bytes
> >   qcom/venus-5.4/venus.b02 | Bin 873596 -> 0 bytes
> >   qcom/venus-5.4/venus.b03 | Bin 33792 -> 0 bytes
> >   qcom/venus-5.4/venus.b04 |   1 -
> >   qcom/venus-5.4/venus.mbn | Bin 919708 -> 921236 bytes
> >   qcom/venus-5.4/venus.mdt | Bin 7020 -> 9 bytes
> >   qcom/vpu-2.0/venus.b00   | Bin 692 -> 0 bytes
> >   qcom/vpu-2.0/venus.b01   | Bin 7376 -> 0 bytes
> >   qcom/vpu-2.0/venus.b02   | Bin 300 -> 0 bytes
> >   qcom/vpu-2.0/venus.b03   | Bin 20 -> 0 bytes
> >   qcom/vpu-2.0/venus.b04   | Bin 20 -> 0 bytes
> >   qcom/vpu-2.0/venus.b05   | Bin 20 -> 0 bytes
> >   qcom/vpu-2.0/venus.b06   | Bin 20 -> 0 bytes
> >   qcom/vpu-2.0/venus.b07   | Bin 24 -> 0 bytes
> >   qcom/vpu-2.0/venus.b08   | Bin 16 -> 0 bytes
> >   qcom/vpu-2.0/venus.b09   | Bin 939184 -> 0 bytes
> >   qcom/vpu-2.0/venus.b10   | Bin 42976 -> 0 bytes
> >   qcom/vpu-2.0/venus.b19   |   1 -
> >   qcom/vpu-2.0/venus.mbn   | Bin 2031188 -> 2031620 bytes
> >   qcom/vpu-2.0/venus.mdt   | Bin 8068 -> 0 bytes
> >   22 files changed, 3 insertions(+), 23 deletions(-)
> >   delete mode 100644 qcom/venus-5.4/venus.b00
> >   delete mode 100644 qcom/venus-5.4/venus.b01
> >   delete mode 100644 qcom/venus-5.4/venus.b02
> >   delete mode 100644 qcom/venus-5.4/venus.b03
> >   delete mode 100644 qcom/venus-5.4/venus.b04
> >   mode change 100644 => 120000 qcom/venus-5.4/venus.mdt
>
> I think it's more typical to use Link: statement in the WHENCE file
> rather than a symlink itself. `find -type l' returns a single file: the
> newly created venus.mdt link.
>
Thanks for the review and informative comment. I updated the WHENCE file,
but missed the detail about not creating the link on the link in the file
system. Oops!

I'll mail a V4 pull request to the list that drops the venus.mdt file.

>
>
> >   delete mode 100644 qcom/vpu-2.0/venus.b00
> >   delete mode 100644 qcom/vpu-2.0/venus.b01
> >   delete mode 100644 qcom/vpu-2.0/venus.b02
> >   delete mode 100644 qcom/vpu-2.0/venus.b03
> >   delete mode 100644 qcom/vpu-2.0/venus.b04
> >   delete mode 100644 qcom/vpu-2.0/venus.b05
> >   delete mode 100644 qcom/vpu-2.0/venus.b06
> >   delete mode 100644 qcom/vpu-2.0/venus.b07
> >   delete mode 100644 qcom/vpu-2.0/venus.b08
> >   delete mode 100644 qcom/vpu-2.0/venus.b09
> >   delete mode 100644 qcom/vpu-2.0/venus.b10
> >   delete mode 100644 qcom/vpu-2.0/venus.b19
> >   delete mode 100644 qcom/vpu-2.0/venus.mdt
>
> --
> With best wishes
> Dmitry
>
> Best regards,
Nathan

--0000000000007b8bc605ebe28ca7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Dmitry,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 25, 2022 at 2:08 PM Dmitry Bary=
shkov &lt;<a href=3D"mailto:dmitry.baryshkov@linaro.org">dmitry.baryshkov@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On 25/10/2022 23:54, Nathan Hebert wrote:<br>
&gt; The following changes since commit 48407ffd7adb9511701547068b1e6f0956b=
d1c94:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 cnm: update chips&amp;media wave521c firmware. (2022-10-1=
7 10:20:43 -0400)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://github.com/nathan-google/linux-firmwar=
e.git" rel=3D"noreferrer" target=3D"_blank">https://github.com/nathan-googl=
e/linux-firmware.git</a><br>
&gt; update_sc7180_and_sc7280_firmware_v3<br>
&gt; <br>
&gt; for you to fetch changes up to 99a1a406c0bc9144de6b8de8efd983cfe038913=
1:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 qcom: update venus firmware files for VPU-2.0 (2022-10-25=
 13:34:43 -0700)<br>
&gt; <br>
&gt; ----------------------------------------------------------------<br>
&gt; Nathan Hebert (4):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 qcom: replace split SC7180 venus firmware i=
mages with symlink<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 qcom: update venus firmware file for v5.4<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 qcom: remove split SC7280 venus firmware im=
ages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 qcom: update venus firmware files for VPU-2=
.0<br>
&gt; <br>
&gt;=C2=A0 =C2=A0WHENCE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 24 +++---------------------<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.b00 | Bin 212 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.b01 | Bin 6808 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.b02 | Bin 873596 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.b03 | Bin 33792 -&gt; 0 bytes<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.b04 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.mbn | Bin 919708 -&gt; 921236 bytes<b=
r>
&gt;=C2=A0 =C2=A0qcom/venus-5.4/venus.mdt | Bin 7020 -&gt; 9 bytes<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b00=C2=A0 =C2=A0| Bin 692 -&gt; 0 bytes=
<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b01=C2=A0 =C2=A0| Bin 7376 -&gt; 0 byte=
s<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b02=C2=A0 =C2=A0| Bin 300 -&gt; 0 bytes=
<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b03=C2=A0 =C2=A0| Bin 20 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b04=C2=A0 =C2=A0| Bin 20 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b05=C2=A0 =C2=A0| Bin 20 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b06=C2=A0 =C2=A0| Bin 20 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b07=C2=A0 =C2=A0| Bin 24 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b08=C2=A0 =C2=A0| Bin 16 -&gt; 0 bytes<=
br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b09=C2=A0 =C2=A0| Bin 939184 -&gt; 0 by=
tes<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b10=C2=A0 =C2=A0| Bin 42976 -&gt; 0 byt=
es<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.b19=C2=A0 =C2=A0|=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.mbn=C2=A0 =C2=A0| Bin 2031188 -&gt; 203=
1620 bytes<br>
&gt;=C2=A0 =C2=A0qcom/vpu-2.0/venus.mdt=C2=A0 =C2=A0| Bin 8068 -&gt; 0 byte=
s<br>
&gt;=C2=A0 =C2=A022 files changed, 3 insertions(+), 23 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/venus-5.4/venus.b00<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/venus-5.4/venus.b01<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/venus-5.4/venus.b02<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/venus-5.4/venus.b03<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/venus-5.4/venus.b04<br>
&gt;=C2=A0 =C2=A0mode change 100644 =3D&gt; 120000 qcom/venus-5.4/venus.mdt=
<br>
<br>
I think it&#39;s more typical to use Link: statement in the WHENCE file <br=
>
rather than a symlink itself. `find -type l&#39; returns a single file: the=
 <br>
newly created venus.mdt link.<br></blockquote><div>Thanks for the review an=
d informative comment. I updated the WHENCE file, but missed the=C2=A0detai=
l about not creating the link on the link in the file system. Oops!<br><br>=
I&#39;ll mail a V4 pull request to the list that drops the venus.mdt file.<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b00<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b01<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b02<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b03<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b04<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b05<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b06<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b07<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b08<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b09<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b10<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.b19<br>
&gt;=C2=A0 =C2=A0delete mode 100644 qcom/vpu-2.0/venus.mdt<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
<br></blockquote><div>Best regards,<br>Nathan=C2=A0</div></div></div>

--0000000000007b8bc605ebe28ca7--
