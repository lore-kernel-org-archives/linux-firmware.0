Return-Path: <SRS0=xHjc=JF=netronome.com=louis.peens@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A19EC433B4
	for <linux-firmware@archiver.kernel.org>; Thu,  8 Apr 2021 12:56:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C645161132; Thu,  8 Apr 2021 12:56:42 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45A38610FC
	for <linux-firmware@kernel.org>; Thu,  8 Apr 2021 12:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45A38610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=louis.peens@netronome.com
Received: by mail-ej1-f49.google.com with SMTP id r12so2873360ejr.5
        for <linux-firmware@kernel.org>; Thu, 08 Apr 2021 05:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=netronome-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=OD6UnlxVFVMuSGfcuSUyQoZ6FhTAjbJ3I19nhjEedvA=;
        b=DBQtjX1q9k+rWwzxTEJrEXwJSzCuvP2QbaMUkOG3/mkVmLCJoJG2UhohuMZo7IDM9X
         0oUfIPuRIUkRlREoHZXDg3ippq4PMrRzLvW19izc7rtpOQ6q39JqwMuS6AKu6KGI+qnd
         EmEVo10SlkWxQcMEF49MtYepZ8Tg379Wm8lrZsAb9fchxSiXtHYkw9BEQyl/glIZtS9U
         DeiyI4QtZO5DCWlKrTD3FVlC5apfPqISkOhT04JwZYFmXDYMzZthjgQ+sCW9wDKGQw4j
         7sW61Tn++TymBYALsEozzKHQpg7otA84cSjMAbWL7ypmHNex4UUUUO4hLa0Yi8hWvlE2
         RcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=OD6UnlxVFVMuSGfcuSUyQoZ6FhTAjbJ3I19nhjEedvA=;
        b=MCLuYeh2OLZWGsGn50+/Mc51Q2W/fB3/Blgsw0DZThxItGhqnOPRrDh16NNJz3fwl8
         TMh06O3TyIV4LEidIIpbDD11uxZ31QdnUuww18nvUrdYSkmRG2ngt8qDdkcmPwKIoQle
         Wp0fqFCnjZ3EFb++gn1fDE045EKc4zk0mB0aQn0BOdLazV18WyGU9d6oj6akKwIcf7RA
         mhJn95o5Q4nE6heaidPcmUTFC0Wt5tFjS8VgZesgABlK+Y4AkrBIyWPhvyEtg5j6gmc8
         h7FSn7owkga1TvdPV5TjZDKGGxclblGzcEv2ra5HBp6TSF8FfTKki7ReQWVgZTYAyuBa
         40mw==
X-Gm-Message-State: AOAM531GMSo9PzhtcmbqMMhaEiRnqVj++gt5id0PuiLYJer/EeGiocT3
	iBHAFSifmUG1nBmjhVuuGPBDr9J74bW1H0XU9uSFRtTls0snZg==
X-Google-Smtp-Source: ABdhPJzGOXGgIcCxg4GG83TwlOAcnSLJkMB11XEKWWDAWxG3ECAm0q//ldXn5MOoJ95/BDSDm37C+IXXTfcpPbGfwEQ=
X-Received: by 2002:a17:906:3c07:: with SMTP id h7mr10278717ejg.446.1617886600649;
 Thu, 08 Apr 2021 05:56:40 -0700 (PDT)
MIME-Version: 1.0
From: Louis Peens <louis.peens@netronome.com>
Date: Thu, 8 Apr 2021 14:56:25 +0200
Message-ID: <CAK0s0=kjP_30nSH2-qa959HNSSX_sGDubyWOe0sYz1RAUJMLtQ@mail.gmail.com>
Subject: [pull request] Netronome flower firmware update
List-Id: <linux-firmware.lore.kernel.org>
To: Linux Firmware <linux-firmware@kernel.org>, oss-drivers@netronome.com
Content-Type: multipart/alternative; boundary="0000000000001e739505bf75945a"

--0000000000001e739505bf75945a
Content-Type: text/plain; charset="UTF-8"

The following changes since commit af1ca28f03287b0c60682ab37cc684c773de853f:

  amdgpu: add arcturus firmware (2021-04-05 10:40:08 -0400)

are available in the Git repository at:

  https://github.com/Netronome/linux-firmware

for you to fetch changes up to 6c419aea3689472787a02d19f62815e08856336d:

  nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.14.A.6
(2021-04-08 14:44:28 +0200)

----------------------------------------------------------------
Louis Peens (1):
      nfp: update Agilio SmartNIC flower firmware to rev AOTC-2.14.A.6

 WHENCE                             |   2 +-
 netronome/flower/nic_AMDA0058.nffw | Bin 6683216 -> 6857912 bytes
 netronome/flower/nic_AMDA0096.nffw | Bin 4312000 -> 4417672 bytes
 netronome/flower/nic_AMDA0097.nffw | Bin 4312000 -> 4417672 bytes
 netronome/flower/nic_AMDA0099.nffw | Bin 4314368 -> 4420040 bytes
 5 files changed, 1 insertion(+), 1 deletion(-)

--0000000000001e739505bf75945a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The following changes since commit af1ca28f03287b0c60682ab=
37cc684c773de853f:<br><br>=C2=A0 amdgpu: add arcturus firmware (2021-04-05 =
10:40:08 -0400)<br><br>are available in the Git repository at:<br><br>=C2=
=A0 <a href=3D"https://github.com/Netronome/linux-firmware">https://github.=
com/Netronome/linux-firmware</a> <br><br>for you to fetch changes up to 6c4=
19aea3689472787a02d19f62815e08856336d:<br><br>=C2=A0 nfp: update Agilio Sma=
rtNIC flower firmware to rev AOTC-2.14.A.6 (2021-04-08 14:44:28 +0200)<br><=
br>----------------------------------------------------------------<br>Loui=
s Peens (1):<br>=C2=A0 =C2=A0 =C2=A0 nfp: update Agilio SmartNIC flower fir=
mware to rev AOTC-2.14.A.6<br><br>=C2=A0WHENCE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 2 +-<br>=C2=A0netronome/flower/nic_AMDA0058.nffw | Bin 6683216 -&gt; 68=
57912 bytes<br>=C2=A0netronome/flower/nic_AMDA0096.nffw | Bin 4312000 -&gt;=
 4417672 bytes<br>=C2=A0netronome/flower/nic_AMDA0097.nffw | Bin 4312000 -&=
gt; 4417672 bytes<br>=C2=A0netronome/flower/nic_AMDA0099.nffw | Bin 4314368=
 -&gt; 4420040 bytes<br>=C2=A05 files changed, 1 insertion(+), 1 deletion(-=
)<br></div>

--0000000000001e739505bf75945a--
