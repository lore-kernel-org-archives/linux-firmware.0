Return-Path: <SRS0=lGKA=BF=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65467F3D315
	for <linux-firmware@archiver.kernel.org>; Thu,  5 Mar 2026 16:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 365F0C19423; Thu,  5 Mar 2026 16:01:28 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 622F8C116C6
	for <linux-firmware@kernel.org>; Thu,  5 Mar 2026 16:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 622F8C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625AFiUB935974
	for <linux-firmware@kernel.org>; Thu, 5 Mar 2026 16:01:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OM+qeQl3J1tkLaD08rSky7
	Fdg2qwoIKzraqLR/pXNFI=; b=TiI7RTqEpDqjiS6RmhaKXyN8clbqf8h7k7llCL
	tsXEQpm9J0+aRD3pYGRqcX6MVKHIjLi+S1v2llF2cVDTcp1iEeIJmKK5a+6AnP+v
	g4CgEcy+fU936HQqtDZBK44quSnGX9P0kpj75gF5GC7zqC1x3ZdKcFn7hML18CiV
	vpQheMOTokwqUsmysycLim+NO86xFlkO9FXzlBDMBnf2WdPjhJR5Kg+0ojgFI30D
	IWJLJPdFT/Ma/5CpQmSa20O2Htebc1oeDkHmGQzulR7kq8vcMGlBWymC7q5zO8mM
	aAgSSHjrMNVj3aZfyZnqv06BqNYjpymLyBN60986FkkHPL1A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq04u2qv3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 16:01:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c629a3276e9so29946650a12.2
        for <linux-firmware@kernel.org>; Thu, 05 Mar 2026 08:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772726486; x=1773331286; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OM+qeQl3J1tkLaD08rSky7Fdg2qwoIKzraqLR/pXNFI=;
        b=EZQeOFAozP70iC9+l8nTikQ6r+dTBLj9kVGMawyd01pP96UCf5YxZ2gd+CdvSpXGde
         2xmPS18Uz4aX6LbcS+16DrqPxLsDWCmdwA6I+JtL2J59rxnaTyqvh0vVn65CkaSjQZTt
         1Y67wTaohvbsPdx27p+atxkh2VZhvaRf7AvZs+s8NaeTXUP7CQTiHjD5Ddwos81I3qNX
         T2LqvJ+8kOMYaZYc6p5l+H9z3MotoQc6PxgWU8YKRruClej1m83wc/pLpVcTAiPmY1Vj
         auONi/Hi4bzYOyBaJBO77DXQectz9ZUaxV22T94X/axyFjtFEkLUseb5QlQusb86VXg3
         Dqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772726486; x=1773331286;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OM+qeQl3J1tkLaD08rSky7Fdg2qwoIKzraqLR/pXNFI=;
        b=aIMZHFzkt/Drs/od5Gm2YtMJmmqjC02rJba6MMPC7B/NLqhcanypd+XKPprH+0d9fy
         z84kIIHusPV9eNzBex88E+nF12XSbQpfrOGX8yj3Ez93qB/VFCLSNJhZOyhQlqcPr0Sg
         w+H054vDyQ6vlf0VgZ22uKMo5ApNZHGwgu0brUcweMzXLctxm5RX7mo17f2dCvqVf4fi
         zoQFKB+bghZHNl7v0+kEJPotu9BPVzxa57w+rSzBNpi1aBanJE+yWZbuZeGNaPGlybAp
         iM3Td27qV43kZSkijZLykcaeTJSPNqODT++bRqOtdC+93qLQ/FJK16SXmYlTvskKO/jV
         GYiA==
X-Gm-Message-State: AOJu0YzGpN3/hIH4NvbEv5ONLcDZuvFHnw8/eqD1cWh7FsUWIos1FukW
	UBHuPd7xJ9wzvhBT/V7WYJcxo63csYz1A+aLn+GJwUiXZ9Ely7OXQn+E2K8ywUUZIGAn6t4GT+C
	K7n33C5MGUimwvMshxk1AGOwj4dXO83svEnbOZszgy8fvtwL141Y7ebpIRXyoaFOagLbgVfU=
X-Gm-Gg: ATEYQzx8vPjMSa6obfEVLsJ+ZOyI7wwoBBhGz5sgXl/kRw9wwAWCCoC0dpMXj9+lX5i
	RSVuCQuVfq1HUH156pFjnSairNRVNqTWWtDckSHQEX6Ivkz1tCtvT9YP3lB3E4+8YGDRFvI5tYo
	8Iww+88RbZv2aykbAFfxOn23paTB3AekbKw+jTKnZwOtbn9sfNXwp4/ZhfGZp0yqmvk8PoTuBMb
	PvP/HLYOz3J6vhlxO5lAdyawWOcgrr2uqwPxegqvR7U6ZzRlq6b9t4ANIM7ErMdUk9I3AmgZQ4+
	I7/Yb0RatI5wiqhfl9C55Qumi6cuitKdLsz74wjUuNSk+uoz7zL9Ans4POmgBy/MccQOiX5GlEW
	eTGRd/SeQqiCBSOzAyUZ+PEcvkuJNOqSvKdRcmJ1aCBFZGqsjbw==
X-Received: by 2002:a05:6a21:600e:b0:38e:90ca:5a4b with SMTP id adf61e73a8af0-39854a951cdmr55028637.45.1772726485226;
        Thu, 05 Mar 2026 08:01:25 -0800 (PST)
X-Received: by 2002:a05:6a21:600e:b0:38e:90ca:5a4b with SMTP id adf61e73a8af0-39854a951cdmr54957637.45.1772726484331;
        Thu, 05 Mar 2026 08:01:24 -0800 (PST)
Received: from [10.216.16.14] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7395cde587sm1027290a12.18.2026.03.05.08.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 08:01:24 -0800 (PST)
Message-ID: <e643e0d8-4f3d-445a-991c-a95d564d96ae@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 21:31:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Saddam Patan <saddam.patan@oss.qualcomm.com>, kssb@qti.qualcomm.com
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update CDSP firmware for QCM6490 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: faX-hhTSB0sXM8P4I1JMYeVQ6rPzX49K
X-Authority-Analysis: v=2.4 cv=eqTSD4pX c=1 sm=1 tr=0 ts=69a9a8d6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=tIEQnbreWRucofZKJxkA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: faX-hhTSB0sXM8P4I1JMYeVQ6rPzX49K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDEyOSBTYWx0ZWRfX9XVHCe87c0/u
 gQBIWBUpAP5Kp1jxmg8agDeULggAnTc6enXrTqjJVb7LX7lu/o9MC3fuvUNTD8VViHrliPBWWiU
 bDYrTDe+wEyONZEur+sRPpttcuwLrCMD80ekic2ON7VWBMhwbwakb34U+xP57QiMi5aTKHGDCHn
 FAaBYq2iU36tW+NdB5uQC7ehA1zd9VL3F1XSwajyCsYq4LxwG0zp469nvpKHTrg7A4gVbbvybw1
 X7OaowS+mOLp21HYon/xRmssLnkByQNza5/j0xBG1gVGvyoUKkaR9/5yUzhgZLhJWQtGdqmsP1S
 IE7YGFFtXylnQICgZRqNfoKX588MUvbdDpiDHQnFmxK09rEjgT4dCHdiao3wA7lYMBYM5SetLIW
 0xQxPzYNMu/ewCkUeGkeSnzPUOYhRzbmDeoYiMY9Du2yE0LmWABd5USZaoMcwss/R92ZJbZ+nOG
 ZXXGNuFnGiOVnPbpFdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050129

The following changes since commit 4d2b2774ad4415bdb0a987802ea4324c160c1d14:

   Merge branch 'robot/patch-0-1771956864' into 'main' (2026-03-05 
10:25:09 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dspbins-kodiak

for you to fetch changes up to f58642691280c62d91d8612f547c1fbe99533271:

   qcom: Update CDSP firmware for QCM6490 platform (2026-03-05 21:24:43 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update CDSP firmware for QCM6490 platform

  WHENCE                |   2 +-
  qcom/qcm6490/cdsp.mbn | Bin 3641344 -> 3641344 bytes
  2 files changed, 1 insertion(+), 1 deletion(-)
