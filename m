Return-Path: <SRS0=MO3R=C3=oss.qualcomm.com=dikshita.agarwal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53DAFF886F
	for <linux-firmware@archiver.kernel.org>; Tue, 28 Apr 2026 06:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9E137C2BCB5; Tue, 28 Apr 2026 06:15:27 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D2A83C2BCAF
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 06:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D2A83C2BCAF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RMTO9i1625529
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 06:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pppX78l8AJlZDXFQ6BpusF
	aGjUtuyS4AG2WGe5ryS5k=; b=pmUo3NuFcpoeMubnNae5b/0pWfqn8PHKEVcmnd
	ImIFQDjoZNxMA5UZ7Esd+l5D09mX5THjhhnLhd4wpXtmWmpBVbGMIBH6oZZOGeEw
	Rqd7rlWj8ez4Zlz6mCsjXUGU/3fCJd7FIsIcoC/RzUParqAQ2pSkcCvwSEcFfSXG
	2Zs8FZx5bEc59SoLO/WE3z9MCCd4rBDcjLuUzA9WhAl9E2HdCRRWpnxfGGMkm+T+
	ZjVpsIi/V1EBP7vMKjVW3EQ+LMAGFcqj1eAnwASz3pppoYT7D9NoyVGyZCY+NL2G
	WNXY3KX4GkFtUyaqOcytdZ1J99s+B1q7zCo7GxgQRY+BBnqw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgms9fe6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 28 Apr 2026 06:15:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b7c904d476so35260545ad.3
        for <linux-firmware@kernel.org>; Mon, 27 Apr 2026 23:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777356925; x=1777961725; darn=kernel.org;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pppX78l8AJlZDXFQ6BpusFaGjUtuyS4AG2WGe5ryS5k=;
        b=Auk/xyaPO/5xWOcUbBRctAd/kM3HHz2+HanDb/NMjcvb+6oHiAoR4jL/3TxviRtt8u
         GTDH2PDBWNbl2L/H8/StDUamyeMchhYLaSbhlDD+96NXRqAHsBHXwOwQUjvVwVkkitM5
         OpZPDlBKoXnVOHq8wMjBEVb/E4q0NvQr8NDJYv7+5P9UiPy7y5YzoiHKuwCskYxoqk2u
         3LE7GYCgjG87VRyyx4Dv2XSMuGdhy2siGnCCTMaXCuuXpsGxBEVjLOCpfhPxzKWoNaoy
         oCNT1kCLJQKlvjkbX2DeBLTRoXkpsU6Hz2+yQTxd7+tQtjIKD59jOkZZ0pmKsGbwf6y0
         wU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777356925; x=1777961725;
        h=content-transfer-encoding:cc:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pppX78l8AJlZDXFQ6BpusFaGjUtuyS4AG2WGe5ryS5k=;
        b=k+OXQcBdruG2d0gCusb/T6TQlu3tUvbQAuxb/dRTgXn1aHH//JlB+TUnUSdKZg4NcY
         wJoQNrYGxgYts3w/xBnASRFNuakZHZIStKlSnvI8yofhEVmScjftdXfakdZk9/UQqOiA
         ERzw8oXZqPc0smI7KZEigcQt79yBN9iHhVzKQ5FyC7wIUwmnzXnPYhR4w1uGW2qKYJhq
         ANsjazuHrEVEbNhMsVLgQH7EWvFGg+qWXx37e4/k8sFYHNdLLho81WFnCr+ZJt7QUHNA
         ikZLmP9iLll2xRoQkNbiKVC4cV5UbpgqlCA1ChG1wuxWwQP3GmdsWCgg+1TtiA/pibec
         UznQ==
X-Gm-Message-State: AOJu0YxplqbSXYwfSUR9SGYtI+eS3iHarVjsbewSuLoioIt+SQBkYBHx
	Z2YAV9mZrk+WrNb/pvbrehVJFpae+V4p+QOAUQ/GyPbZgrXu6D1bO61NaDBA/6/4rLbJ+bdm54J
	cUERdmTdNjpBpvhxOHsICwTAkxKSpDZ0ol/tKXd/t6fI9Ce3kHq9jQg0cVG/bAeUgqb5ClaQ=
X-Gm-Gg: AeBDieu95omh/NDO1vznFJAGcvMy7MmYubmZhWs97F+1U1T+9ClhNNtp6hVvzGL8lDm
	oGTU0R8ATECAaYREkBMl82pVtLt4Fzp4zQompPFvJwV3K6Ls5w1M8lzUQVxZozn2+FxAJrTWBqM
	8/N6QRvkAfFEYGEF1mG6SOMo+q82rPUMn9pEU60nMYNy5sIJxf9bp4kPCxlH/k5O2TgCofM33qo
	p5X43X2GzA5mLE3WP9opR6fI+Y/Y4BBDmDHofEsbKhsJBu+uRbXUa0RuW6qBcj7PTvTDI4q9uYx
	5kBRdjPq/nvzI+43VsjptHZ8t6E9mcLUNQ7alA9nTdU+e11q61+QJQ6H1jNy6s94mgs+zRFQR+Y
	pG1c/csh2RV3Q+xhXyRGfzaroVRyAGG7k9rgr8vqFo+Z9HvrheGqyavmjoUo6fPDK
X-Received: by 2002:a17:902:708b:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2b97c4798ecmr13287565ad.22.1777356924935;
        Mon, 27 Apr 2026 23:15:24 -0700 (PDT)
X-Received: by 2002:a17:902:708b:b0:2b4:689a:e411 with SMTP id d9443c01a7336-2b97c4798ecmr13287305ad.22.1777356924427;
        Mon, 27 Apr 2026 23:15:24 -0700 (PDT)
Received: from [10.0.0.4] ([106.222.231.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97ac8cd29sm14162995ad.61.2026.04.27.23.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 23:15:23 -0700 (PDT)
Message-ID: <cd76b0b8-93fd-a0b3-2ef9-6f73885713b7@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:45:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Subject: qcom: vpu: add Gen2 firmware binary for Agatti
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o2rhssZZoTUqlMbUGBNlTc0QCYX7waZT
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f0507e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IsmkTJhEuG6GyfueqI04Wg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=qC_FGOx9AAAA:8 a=ya5Tr50J0yUigSC4VLwA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA1NCBTYWx0ZWRfX44l4gdztD5CS
 MNRFP/P6rPrPiLCJ/+8JfQ4G+9JsvBejEEOImoEx+t+FBGyg3Q96ZeAlci8iFetPO9NaBHxa2o4
 h9cWUcS6VWsaO3HZruJpbHia1VJhKp/W3V6RPhhXD1RGzEICnQ+Th9Dd6cLWqbwECgGhd2CfogQ
 mKBd5uWBY+0raZJD0oYIYkF//S24mEuuUbwgj0UkSzSSxP4p/wa/HYb9RJWOmKw7+uAQkHwpcs/
 zkelRgBk8W/9c41QHQ6LNTLiMhx5d/OS8XkXkuFNXFXheQDGmitQ/IPIuV6zyHqCvRSrSKgRUPD
 N8acuqEGN3O3I6FGKwcHlqqWhupA07d16EeKLK5s3S1f/vFZFfxz+SMshtZbNY8U4msYOsORZxb
 6i+RjeF1HXnfKbUQO61hLjLdfUgytfIdywRDslCPDo99LsxyuLB+WCPbOY0GXQoYaUjnkIwlgKG
 9VBacMaSPMaLr8L99HQ==
X-Proofpoint-ORIG-GUID: o2rhssZZoTUqlMbUGBNlTc0QCYX7waZT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280054

Hi,

The following changes since commit 3fc7117bb925983bc39d7ba957ce5fafe1f65d41:

  Merge branch 'wcn6855' into 'main' (2026-04-17 13:57:51 +0000)

are available in the Git repository at:

  https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
video-fw-Agatti-Gen2

for you to fetch changes up to afe7a6049a8bcac291528d400214410d3debe966:

  qcom: vpu: add Gen2 firmware binary for Agatti (2026-04-28 11:39:21 +0530)

----------------------------------------------------------------
Dikshita Agarwal (1):
      qcom: vpu: add Gen2 firmware binary for Agatti

 WHENCE                         |   4 ++++
 qcom/vpu/ar50lt_p1_gen2_s6.mbn | Bin 0 -> 1861732 bytes
 2 files changed, 4 insertions(+)
 create mode 100644 qcom/vpu/ar50lt_p1_gen2_s6.mbn


Thanks,
Dikshita
