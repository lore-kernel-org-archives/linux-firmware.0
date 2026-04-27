Return-Path: <SRS0=JFja=C2=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01410FF8862
	for <linux-firmware@archiver.kernel.org>; Mon, 27 Apr 2026 10:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BF265C2BCB4; Mon, 27 Apr 2026 10:00:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E8786C19425
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E8786C19425
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T9gv2879342
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A/F6pJQ535BtiE6kHiK2uX
	pTvE2wMkJB6+FXZ1DYgEw=; b=J6ekp9Tw/yyejKDT++EdAQvX/kANH8exdCT6nV
	yfZ4tVYRIDLpkzxI233SrnUw/+rwECpYexGENCIZcPZUpjBjpKb7O14T18GZKem1
	oPZg11gtlrn+9XEY7eu/f5HkrX/YgXFSPpKGxa6hwNNtE9FzUdUvOcxxni6ahUPV
	SixNe3U8lZsSksRIc4Kbd6/4cHjVkxJRS1ii3TxmGFLfWHBshpjgqRmcZad32EXx
	N4fGb2+ukyjXXMcBFuReMPEv4tnDmACzX41cf0H3ZhT3l47FAOsp7NvZRYlY8NLi
	UAta9eDE4OKwzsjGK6eWoIUhQ/pp0tV9ukxsivTeAi7EbPQw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2wkab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 10:00:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c798fc1a426so3544082a12.2
        for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 03:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284022; x=1777888822; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A/F6pJQ535BtiE6kHiK2uXpTvE2wMkJB6+FXZ1DYgEw=;
        b=EDKincEzUnWZuZEqzbYGV3g3DQl08PWmhxv74+7FdHi28B378/C8sB3NDj1Ti8crxP
         rFZVIrr3F+wpz06H2FdM3206YJSIXDAVPBVB4Z8JrZVYMxjJvuwvVCSlbvXkXe4zgQl4
         Ha0c481b0rLL/bbk6ZQ7vUDKXBniC9NeP53ZRNNuGAgcJGnrm94wBA20xLOkBuLly15o
         6TbdDFa4N8Nz4x0+A6MJt+Ae0bQs5V4n8vF9N6Th41IFwAx9H+tC7BCXnqJVF43rvoGU
         EvuwrlKb+M4X1IM/TWlwBW7WTQyliWCHFlYic6rzBV6KcAKdkvXphVEON0mkQJo90EE3
         EoiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284022; x=1777888822;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/F6pJQ535BtiE6kHiK2uXpTvE2wMkJB6+FXZ1DYgEw=;
        b=EDdLRxdljlCgrZs7LwnHzy4rLshSrDKpZuZExt0AjIg6mcPQfB2W5xwDFofNdVWc6r
         WKBNrILOtvao4r2HViL3ey45MIgy8K571FUO/Bx4JR6ULF5wkRsXL2OGbQzSy00Rs+1i
         LhrC5IC50XROXrTU6lFOIWg2MAWzJjiu0aJG+tkYKceqPa6uacmXo4frAMo7/dgeMrVi
         1cWW/a04hIwSsfrFxtkIfVhuOTphUDS+Yc50Oqid5dXKwG2WkC+shm1gkCXO1TVmodfq
         PuiE+uLrRvECpVWLSFaa7yBHWGk3wWcmvy2ezYLNhi1Dg3nYwG+XZHxlWsHdJE7pwOHK
         imxQ==
X-Gm-Message-State: AOJu0YzvyULdoVDXnDQxSpN866mkoU6iV9NOElxZC3JJrRWbnyXvb2V4
	afsV8QwS2dtvsURfdCpa4VYn+mmCFJMz92+d/ymop3aVCmw/NLBl6eCT7vAlUVJGyP2cs2ZEZjV
	S/2uALtbHxuJr2ByW6HMYsods8jk3hhPh3sIryH5vTOFoCsj1E782fIEQkLq5w0ISfp/9T/U=
X-Gm-Gg: AeBDiev9hD77/Y11QWcMJ0WCnr9cljKGcyguXdJD/nZ252CpvstBoNvljAppPwvkXDN
	qzUABWVOajz+qV3ukZ0t+iUDbuAlhuwlWbdWBzDYjZYUGXL8DJdZ9b1YzlLp3BlVuOpjiGC2ueY
	zPkBAP+W+xUgqR9GoNM+dFWk4ePz0rJotpOCjEunQHujZbBYH6cnrSDDNynvZf57+fzcDNeAiIm
	ceYQ4ombVNC9O2nBymc1A3z+2paE2iulVOKG1mCP+5PT3MF4IFZeBUgDK5ev+b7yIXZ5Z+YKh3D
	GHwvjwc2CI1HVmAxvFpLKWHOakYUmi/b2/abuKjk/voxz+zkEwbH7O3v6qfftYcugZ6DiGvsA4c
	UP+TBuvixoHGPpMrgv2D4Dhgdw3zmV+qU6kZbb8Gyl7siWDjtxpRX7uKBl+d2FtaB
X-Received: by 2002:a05:6a00:2d03:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82f8c87db23mr43140002b3a.1.1777284021688;
        Mon, 27 Apr 2026 03:00:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d03:b0:829:9f46:280d with SMTP id d2e1a72fcca58-82f8c87db23mr43139954b3a.1.1777284020955;
        Mon, 27 Apr 2026 03:00:20 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.231.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec003dcsm32628138b3a.52.2026.04.27.03.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 03:00:20 -0700 (PDT)
Message-ID: <dc0e70be-70ff-8638-5a9b-9fedb7a6aaa8@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:30:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: add Gen2 firmware binary for Agatti
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BIHQsfmBUkVkFfOJKqnCIAXdmDgR6J7m
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69ef33b6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=IsmkTJhEuG6GyfueqI04Wg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qC_FGOx9AAAA:8 a=ya5Tr50J0yUigSC4VLwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: BIHQsfmBUkVkFfOJKqnCIAXdmDgR6J7m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNSBTYWx0ZWRfX9H3XBnkoniXn
 yZIgV58qUJ4SOFQZDNcQ1ormtocD0EX322lOpg2oVW4odZyDgaFGRkPgjWvJVPmD56fr892rwm8
 h0kRWtQKUtxQLzkvop6qRc6hBw1LnpJThIYcE3/BWZ78sBFjCLvv3K3zVC14UUGqb7Kw5t43Yqn
 HlS5pOs43mQ33TlDyb1tQH/6hrIJyOGOcow1W9EgMZUQZJ/EGCypr8d5YxJVuji3bKLreSqOYMw
 nWx2P7HpHI6nmxA7bKawDptvc7xx8bXYGpb+Pohgu4E56ku+9lersuh0brmoZ6kbgJ7ITVKOb9h
 EJwuTzGqlLYFyHTaFSrcEVD460lMj/zPz3Os8/nV4H65oinTEax5BIuMBTARP8CmRSj08E+qjwb
 qFBJcdPvtiJsxO0yUAwPUyOmpzU6UPMiGtozyRypl+Q0zOs8j5OxDpk2ydozLDuo26DA3FWP7qa
 x/RaHZhBxdUvN7OuOew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270105

Hi,

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-Agatti-Gen2

for you to fetch changes up to 0d5d45c00868c21cc5cd1d21adf8afd7a73a91ef:

  qcom: vpu: add Gen2 firmware binary for Agatti (2026-04-24 15:24:14 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add Gen2 firmware binary for Agatti

 WHENCE                         |   4 ++++
 qcom/vpu/ar50lt_p1_gen2_s6.mbn | Bin 0 -> 1861732 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/ar50lt_p1_gen2_s6.mbn


Thanks,
Dikshita
