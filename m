Return-Path: <SRS0=ZdRS=AK=oss.qualcomm.com=xueyao.an@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE75EB28C7
	for <linux-firmware@archiver.kernel.org>; Fri,  6 Feb 2026 05:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D8A41C16AAE; Fri,  6 Feb 2026 05:25:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0367DC116C6
	for <linux-firmware@kernel.org>; Fri,  6 Feb 2026 05:25:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0367DC116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6160xeXA3187423
	for <linux-firmware@kernel.org>; Fri, 6 Feb 2026 05:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Fwv90kxa4s3JlgyW3Ona1UIUqYpIuzDTpWjWoGK85nM=; b=Kq
	7fIYN1X64+JVKR8blt+MDd1RFiH2HI/lwMXpoTcUty1vHmoBgfHpQTTEtqSODm+y
	8cV7NIYfUQ+ZFiBTJ6hutYmarRTz+L27Bze7FmPqHR6aVd/79ZP+900DVq3/r0Nj
	h7RgqBWQMn4KvWk86OBpiggVcb+oN9N80NpUtqDI+7wYNc7xy2nGHI44wzYl/+OL
	Vwzb+Y8SyCYCjCqBmA63+5191VVGUifCDIBALNbkrKRUCAXlW1QKEDdH50rJee4t
	+Ojp8ISp1qFpF+ChO+y+Col01oxP/tl13L9vpwMgzrzqcY1CHPx1Vkz2cqsOYKd1
	rTDPYGFYm+PMpr7dG9Ng==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4prxc196-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 06 Feb 2026 05:25:56 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352e6fcd72dso637069a91.3
        for <linux-firmware@kernel.org>; Thu, 05 Feb 2026 21:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770355556; x=1770960356; darn=kernel.org;
        h=subject:from:cc:to:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Fwv90kxa4s3JlgyW3Ona1UIUqYpIuzDTpWjWoGK85nM=;
        b=fsCTq2ulrurYgW9Tf5A5EErLyKSU4FbJMvH4oTGcDNCTir+N6g+G5cCRi1P1XKK6lw
         rAoEfyLYkUMEySd7MyAEazNXDU0QcaM18ijgfunocGJFClBdawh+/OceqfCrpWm4UpWo
         Cy539dKTkH7ad2xzBir7CiZTIcFk0EW5R2DSAhziaoxyOomqRRve/PjRXvV0B/9CoZhK
         4+z81InL5AZpseAPOkXmW/iC4UzvLSV15WlEUfAzzVjnN/QAqY+vPCcYeO6CXql0M6cE
         PWrB2cH6XsysKvFFfuoy5RYwGvaS2ksDqSSiQz/ogfd+mjBzcU/q27uUdhyQN52zxt9v
         F7Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770355556; x=1770960356;
        h=subject:from:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwv90kxa4s3JlgyW3Ona1UIUqYpIuzDTpWjWoGK85nM=;
        b=aOvTuyl31RIPhHxN+rGHXAAz9NKfuQgLJqsvCftEJOKAyB4Oclif0Ru4bSjMsfDYUH
         UHG6Ic/6CbhUtqFqS2ERqIEWY5ZcOu+kc9Gj58ZY4caIACjLzAbqubR8ERibAAhOvfG5
         i+BeOk1rCI1/zeFh/DDJ71tHw3AIqYLll1RVtTKNszz4cESSdr9nkXzTUgjiwoHJIf5C
         fkPgDYWU2Xt6SIBUZQFmuX1WjZG6v6xDtI8v/3SrhbsoGVDqqKgxvlz+Q7F7Ue4g5365
         2LGbPsWq6SU1DPGQfkmdcKzfenK3/uVznup6QBXLEai1AlCrNi7VH85esKxH52UTzax6
         30Xg==
X-Gm-Message-State: AOJu0Yzy1pp35JUtOhPLDyVC2eRKEO9/Ur3hIup0yw0IPeNc+aIpylcZ
	iRb3YC+BI+XTUA0fmst78iuJjZsRmffnu1/1auEd95F/rtVrZhc1Hikf++6ERnpHuw/etdY7SBG
	FAlktyWR2pIuq4HiFPsruwueYCRLfnNKvCCh4JbpQjWBANB+URaof7IVlho3CfA3lU5GDbSM3vw
	==
X-Gm-Gg: AZuq6aKtAWIF9tNA80YAj/omvVH2935RS0ZjaX2033RHNM6zFNblWZJTEopQr7+PT8c
	0/lJX2R7Xd/o9tk9PEAIvbEpDhvJC/HXNou6B8t6L5Wd5lJxVycKbeIh9qRyf30r546FUgjpUiG
	PXUp9BfIuj0J8j3QTaDJUgIQ/Ab+8UysyBK3lmh1eka+L0BxeUArvIBtnHWMieq4k7PqvDF35g+
	M2mXVG1WQHmgPasOR0EAGmsJK9/5V4kn6AjWR+zs2qGlrQjW71whqyWhcyzKoK2zNDSP1CiKkcl
	hv/N5QWeu/6rbIIP/9gvdRKJDeSBpjCKA7KlIkzRgDrJTTj8K4//jNtFFhRtM6ZZx1evRRPhRj1
	V+iQSc5cPYP8i8/lfx6mpPH32nrmARHA4bEXbWMeTX8YbW6Vnl9pR/XCvRRj2r/Z0WznGm5xLZA
	rY
X-Received: by 2002:a17:90b:5282:b0:352:c146:dc39 with SMTP id 98e67ed59e1d1-354b3e69a06mr1131401a91.30.1770355555764;
        Thu, 05 Feb 2026 21:25:55 -0800 (PST)
X-Received: by 2002:a17:90b:5282:b0:352:c146:dc39 with SMTP id 98e67ed59e1d1-354b3e69a06mr1131393a91.30.1770355555206;
        Thu, 05 Feb 2026 21:25:55 -0800 (PST)
Received: from [10.249.21.74] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-354b1e3ca08sm1290613a91.4.2026.02.05.21.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 21:25:54 -0800 (PST)
Content-Type: multipart/alternative;
 boundary="------------cLwt8TqivRfnMSX7IW1dDcTl"
Message-ID: <81c5e83b-9f87-4caf-bf2d-6aa65d25921b@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 13:25:51 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: viken.dadhaniya@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
From: Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Hamoa Linux-firmware: qupv3fw.elf
X-Proofpoint-GUID: xG0k2ONnzYddN0BHMUF8eFVmJ6EIaKLl
X-Proofpoint-ORIG-GUID: xG0k2ONnzYddN0BHMUF8eFVmJ6EIaKLl
X-Authority-Analysis: v=2.4 cv=eLkeTXp1 c=1 sm=1 tr=0 ts=69857b64 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=r77TgQKjGQsHNAKrUKIA:9
 a=qC_FGOx9AAAA:8 a=yj1sxr4RbS7r7ypeV5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=obA1aV8hj3le6LCIXPEA:9 a=HSuFPnXue7irB7X2:21 a=_W_S_7VecoQA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDAzMiBTYWx0ZWRfX2bu6r2DaX4A4
 VCuWt/lTF6VtldWEhAxrYAhERXuS/VIzU2K7G20mrHpi0zi2343a6NqmYL7aVnTC7jz8uufIuus
 MIwKFcyn4yde0vt8O4W++AXum8UgGskzfBjaOBpH60+UdjLMY6PVTUeUv3LKff25oo3/T7ffkYV
 2JwFD730kJ2ct+u2NtbNQbFnHsPCU2CRsvbZba0C/QDlkjSezREyUDYXTrJOG8O/W0xuY2cwjJc
 mqQMkZupHm64VsBlrgQaIRHSctlhgqyY4WnhXd+VyeBjxUMY/gUtXvhqKvysYULe7LOfKo45mWF
 WyQoNcDUn0S1CGvQaCtPDjvH3JC11lA9GjQisQg3k6waXC6wrj6nArMxEdIQ4MVLy0cV1mzaOoi
 +tohmqqs5WSjnX65GMt7RE+EeokT4LWH5l8g78X/w+W+TAAXwUYDY8JMkNVKNqcIosKYJ6LF8SR
 09VCzrQgXHLF2WH0ELA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_01,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060032

This is a multi-part message in MIME format.
--------------cLwt8TqivRfnMSX7IW1dDcTl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

The following changes since commit c695356f6ea11b6585b85d31931bafcb10abb2b2:

Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)

are available in the Git repository at:

https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-hamoa

for you to fetch changes up to d8c5dbbfac6dc054552295c13b03a4ffc959539b:

qcom: add QUPv3 firmware for x1e80100 platform (2026-02-04 13:27:20 +0800)

----------------------------------------------------------------
Xueyao An (1):
     qcom: add QUPv3 firmware for x1e80100 platform

  WHENCE                    |   1 +
  qcom/x1e80100/qupv3fw.elf | Bin 0 -> 52288 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/x1e80100/qupv3fw.elf


--------------cLwt8TqivRfnMSX7IW1dDcTl
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <div data-olk-copy-source=3D"MessageBody"
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">The
      following changes since commit
      c695356f6ea11b6585b85d31931bafcb10abb2b2:</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0
      Merge branch 'main' into 'main' (2025-12-17 00:42:29 +0000)</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">are
      available in the Git repository at:</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0
      <a class=3D"moz-txt-link-freetext" href=3D"https://git.codelinaro.o=
rg/clo/linux-kernel/linux-firmware.git">https://git.codelinaro.org/clo/li=
nux-kernel/linux-firmware.git</a>
      qupv3-fw-hamoa</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">for
      you to fetch changes up to
      d8c5dbbfac6dc054552295c13b03a4ffc959539b:</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0
      qcom: add QUPv3 firmware for x1e80100 platform (2026-02-04
      13:27:20 +0800)</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">-------------------------=
---------------------------------------</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">Xueyao
      An (1):</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0
      =C2=A0 =C2=A0 qcom: add QUPv3 firmware for x1e80100 platform</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;"><br>
    </div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0WHENCE
      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| =C2=A0 1 +</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0qcom/x1e80100/qupv3=
fw.elf
      | Bin 0 -&gt; 52288 bytes</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A02
      files changed, 1 insertion(+)</div>
    <div
style=3D"border: 0px; font-style: normal; font-variant-ligatures: normal;=
 font-variant-caps: normal; font-variant-numeric: inherit; font-variant-e=
ast-asian: inherit; font-variant-alternates: inherit; font-variant-positi=
on: inherit; font-variant-emoji: inherit; font-weight: 400; font-stretch:=
 inherit; font-size: 12pt; line-height: inherit; font-family: Aptos, Apto=
s_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font=
-optical-sizing: inherit; font-size-adjust: inherit; font-kerning: inheri=
t; font-feature-settings: inherit; font-variation-settings: inherit; font=
-language-override: inherit; margin: 0px; padding: 0px; vertical-align: b=
aseline; color: black; letter-spacing: normal; orphans: 2; text-align: st=
art; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; white-space: normal; background-color: =
rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-s=
tyle: initial; text-decoration-color: initial;">=C2=A0create
      mode 100644 qcom/x1e80100/qupv3fw.elf</div>
    <p><br>
    </p>
  </body>
</html>

--------------cLwt8TqivRfnMSX7IW1dDcTl--
