Return-Path: <SRS0=yq1T=GF=lwt.hu=guba.zoltan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A34CDB474
	for <linux-firmware@archiver.kernel.org>; Mon, 23 Oct 2023 02:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DD30C433C9; Mon, 23 Oct 2023 02:35:24 +0000 (UTC)
Received: from mail.gwyll.eu (mail.gwyll.eu [78.131.55.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51377C433C7
	for <linux-firmware@kernel.org>; Mon, 23 Oct 2023 02:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51377C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=lwt.hu
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lwt.hu
Received: from localhost (localhost [127.0.0.1])
	by mail.gwyll.eu (Postfix) with ESMTP id 0592F6CAE51
	for <linux-firmware@kernel.org>; Mon, 23 Oct 2023 04:06:57 +0200 (CEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at gwyll.eu
Received: from mail.gwyll.eu ([127.0.0.1])
 by localhost (mail.gwyll.eu [127.0.0.1]) (amavis, port 10024) with LMTP
 id isMrZZUn3NfO for <linux-firmware@kernel.org>;
 Mon, 23 Oct 2023 04:06:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lwt.hu; s=mail;
	t=1698026734; bh=bf12RNUKXlb12me9NmHuTAt4FszXxZyB+sN5YvRkBPY=;
	h=Subject:To:From:Date:From;
	b=anX7wamUzsoPH0/8v+U3AUNDekrp5zo2hpYNzkn7g0cODcKGRmuVCHFVnLG2oMStr
	 8yt+KgclHXQVaNAwJ42lOJoKL49oSIvST2Dgf7teDjjjoIQku7H4TuME7GvUl8m046
	 U/ODEtq3DSrRN2uQXgUOPYPGXUO4fDESzDXobsfOJSG8fm9VhLLr2Rplk+GNXSsXG0
	 jFCgVSGrKCLSToS3XN4OG/aC2iIGci/DnJEGLcqpo8zMA5gku6BAILZmI+mMmQLGsk
	 QCFx7/S8e6MlQe1gRg3IJqa0gtheMWPHYZSoBOgmV33KueNlTa/Uu63L6vu5cnNMhf
	 DdsE5socOWfyw==
Received: from bonbon-kiszolg.bonbon.local (unknown [213.16.81.163])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.gwyll.eu (Postfix) with ESMTPSA id 4E95F6C866F
	for <linux-firmware@kernel.org>; Mon, 23 Oct 2023 04:05:34 +0200 (CEST)
Content-Type: multipart/alternative; boundary="===============0899529938=="
MIME-Version: 1.0
Subject: =?utf-8?b?2b7bjNin2YUg2YfYp9uMINiv2LHbjNin2YHYqtuM?=
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Webmail <guba.zoltan@lwt.hu>
Date: Mon, 23 Oct 2023 04:07:01 +0200
Message-Id: <20231023023523.51377C433C7@smtp.kernel.org>

You will not see this in a MIME-aware mail reader.
--===============0899529938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body


 =633=644=627=645 linux-firmware@kernel.org
=628=631=62E=6CC =627=632 =67E=6CC=627=645 =647=627=6CC =62F=631=6CC=627=
=641=62A=6CC =634=645=627 =645=633=62F=648=62F =634=62F. =644=637=641=627=
=64B =627=6CC=645=6CC=644 =62E=648=62F =631=627 =62F=631 =632=6CC=631 =62A=
=623=6CC=6CC=62F =6A9=646=6CC=62F =648 =647=645=647 =67E=6CC=627=645=200C=
=647=627 =631=627 =628=647 =635=646=62F=648=642 =648=631=648=62F=6CC =62E=
=648=62F =628=631=6AF=631=62F=627=646=6CC=62F.
            =

                                               =62F=631 =627=6CC=646=62C=
=627 =62A=623=6CC=6CC=62F =6A9=646=6CC=62F
 =




=627=6CC=646 =627=6CC=645=6CC=644 =628=647
 linux-firmware@kernel.org
 =A92023. =645=62D=62A=648=627=6CC =627=6CC=646 =67E=6CC=627=645 =62A=648=
=633=637 =642=648=627=646=6CC=646 =6A9=67E=6CC =631=627=6CC=62A =648 =639=
=644=627=626=645 =62A=62C=627=631=6CC =62A=62D=62A =642=648=627=646=6CC=646=
 =628=6CC=646 =627=644=645=644=644=6CC =645=62D=627=641=638=62A =645=6CC =
=634=648=62F. =62A=645=627=645=6CC =62D=642=648=642 =645=62D=641=648=638 =
=627=633=62A.

--===============0899529938==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body

<HTML><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"/></head><BODY><P></P><FONT color=3D#999999 size=3D1 face=3DArial>=
<FONT color=3D#999999 size=3D1 face=3DArial><FONT color=3D#999999 size=3D1 =
face=3DArial><SPAN lang=3DEN><SPAN lang=3DEN>
<P><FONT color=3D#000000 size=3D3>=D8=B3=D9=84=D8=A7=D9=85 linux-firmware@k=
ernel.org<BR>=D8=A8=D8=B1=D8=AE=DB=8C =D8=A7=D8=B2 =D9=BE=DB=8C=D8=A7=D9=85=
 =D9=87=D8=A7=DB=8C =D8=AF=D8=B1=DB=8C=D8=A7=D9=81=D8=AA=DB=8C =D8=B4=D9=85=
=D8=A7 =D9=85=D8=B3=D8=AF=D9=88=D8=AF =D8=B4=D8=AF. =D9=84=D8=B7=D9=81=D8=
=A7=D9=8B =D8=A7=DB=8C=D9=85=DB=8C=D9=84 =D8=AE=D9=88=D8=AF =D8=B1=D8=A7 =
=D8=AF=D8=B1 =D8=B2=DB=8C=D8=B1 =D8=AA=D8=A3=DB=8C=DB=8C=D8=AF =DA=A9=D9=86=
=DB=8C=D8=AF =D9=88 =D9=87=D9=85=D9=87 =D9=BE=DB=8C=D8=A7=D9=85=E2=80=8C=D9=
=87=D8=A7 =D8=B1=D8=A7 =D8=A8=D9=87 =D8=B5=D9=86=D8=AF=D9=88=D9=82 =D9=88=
=D8=B1=D9=88=D8=AF=DB=8C =D8=AE=D9=88=D8=AF =D8=A8=D8=B1=DA=AF=D8=B1=D8=AF=
=D8=A7=D9=86=DB=8C=D8=AF.</FONT></P>
<P dir=3Dltr align=3Dleft></SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;</P>
<P dir=3Dltr align=3Dleft>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<A h=
ref=3D"https://bafybeidsbziz6ivslf62xw2iprx432lw4qxxwiefj5liqpzctg2wqvlhkq.=
ipfs.dweb.link/fileeindjoiririr.html#linux-firmware@kernel.org"><STRONG><FO=
NT size=3D4><FONT color=3D#0000ff> <U><FONT face=3D"Arial Black"><FONT face=
=3D"Arial Black"><FONT face=3D"Arial Black"><SPAN lang=3DEN><FONT color=3D#=
0080ff>=D8=AF=D8=B1 =D8=A7=DB=8C=D9=86=D8=AC=D8=A7 =D8=AA=D8=A3=DB=8C=DB=8C=
=D8=AF =DA=A9=D9=86=DB=8C=D8=AF</FONT></A></U></FONT></FONT></STRONG></FONT=
></FONT></FONT></SPAN></P>
<P dir=3Dltr align=3Dleft><BR><BR><BR><BR>=D8=A7=DB=8C=D9=86 =D8=A7=DB=8C=
=D9=85=DB=8C=D9=84 =D8=A8=D9=87</P>
<P dir=3Dltr align=3Dleft>linux-firmware@kernel.org</P>
<P dir=3Dltr align=3Dleft>=C2=A92023. =D9=85=D8=AD=D8=AA=D9=88=D8=A7=DB=8C =
=D8=A7=DB=8C=D9=86 =D9=BE=DB=8C=D8=A7=D9=85 =D8=AA=D9=88=D8=B3=D8=B7 =D9=82=
=D9=88=D8=A7=D9=86=DB=8C=D9=86 =DA=A9=D9=BE=DB=8C =D8=B1=D8=A7=DB=8C=D8=AA =
=D9=88 =D8=B9=D9=84=D8=A7=D8=A6=D9=85 =D8=AA=D8=AC=D8=A7=D8=B1=DB=8C =D8=AA=
=D8=AD=D8=AA =D9=82=D9=88=D8=A7=D9=86=DB=8C=D9=86 =D8=A8=DB=8C=D9=86 =D8=A7=
=D9=84=D9=85=D9=84=D9=84=DB=8C =D9=85=D8=AD=D8=A7=D9=81=D8=B8=D8=AA =D9=85=
=DB=8C =D8=B4=D9=88=D8=AF. =D8=AA=D9=85=D8=A7=D9=85=DB=8C =D8=AD=D9=82=D9=
=88=D9=82 =D9=85=D8=AD=D9=81=D9=88=D8=B8 =D8=A7=D8=B3=D8=AA.</FONT></FONT><=
/FONT><FONT color=3D#999999 size=3D1 face=3DArial><FONT color=3D#999999 siz=
e=3D1 face=3DArial><FONT color=3D#999999 size=3D1 face=3DArial></P></FONT><=
/FONT></FONT></SPAN></BODY></HTML>
--===============0899529938==--
