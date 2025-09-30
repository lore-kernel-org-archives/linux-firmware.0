Return-Path: <SRS0=PEt3=4J=oss.qualcomm.com=venkata.kota@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE8FCAC5B9
	for <linux-firmware@archiver.kernel.org>; Tue, 30 Sep 2025 08:52:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 608A8C4CEF7; Tue, 30 Sep 2025 08:52:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7C8AAC4CEF0
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7C8AAC4CEF0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HNa9014639
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 08:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DLcDZcc4MfZOrlyfF3tz4p
	frksc70BPPQNpO8V9bL/k=; b=Oxpvm3v6t+MJTItw4pwyAePoSVAPIick74mSEE
	S6qxzoGIfGp/8VzouryWrRVWZZ51ytTeCFzU0dTSTJUdrlQRFSHrlt3rhiKtEs90
	vfrxQRMsq8S5GUlYGwh+1BQExAMgHG9AVyztVsJ2FLe0cUEkGhRpPgpTL/UcLyzZ
	huK17RTDQAa3URPHKpjBawCCXMJODMmIp/Dko/2N6fVD/5oFSpOgp0r5s+Lv5iTu
	ZPPqnZMiKdZU3fXFptwbodS2x/lMezYVn2rvfsoXAROpCQ7dL9//xfv95XsbZ94w
	38NRuVAhEJVawDWelBIWeD0RICJ24fPKn+NaoqvoiobrcU0A==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr0bn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 08:52:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eddb7e714so4970931a91.1
        for <linux-firmware@kernel.org>; Tue, 30 Sep 2025 01:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222343; x=1759827143;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DLcDZcc4MfZOrlyfF3tz4pfrksc70BPPQNpO8V9bL/k=;
        b=j7sjrZ09bm3NrWS2pJ4/eHti6dJM2LXOpQql6b0YVvIwMUu80K0e7F7gVcmno+mGxl
         tZHhm01dgZtk600etFQ+NQnTibtjB4Glvg5fHwvzbNc+1/wca9svSLgxYlR+WtSJcJVn
         kil+LjNyHQeZxTjDcZ4apvJwywSfWeuyvM5hnIspb7giub9S3PUr0C74Vb4o7vHo4bA+
         DywIEN2kDFVbJUT6zJcrO7IlmRc9n1If4QpmXb/S/gOVPfAeLZnwDA8cvcek7zoaFjND
         wzgclANTUQ/1Qr2TU1aqt+1ND8N0N4FscroqeTxU9SCSpcJ0Ki8zeWIO+H1/r0EK857o
         B68g==
X-Gm-Message-State: AOJu0YzJ7P0VVqmt+z5aa+UFxM+nHhoTM+bP1r2MJNvBiN4M68JDDLSQ
	IQkvnlROoGyz9g6G4DvFMPxODTZ0qdmotoax1o5ywOV6b7E6ZGETZglXCODBwome/vCDVuheMPZ
	ADbeCD6kMsoj751tz4ztD485hbDhiqBbDSThVozzbXb462SN2pEPfqlBRFN0PrGvbddB6DgV5wg
	==
X-Gm-Gg: ASbGncsJYMwERU1jyCYDpwqCjDGn0XD7KKs0IND0lPdYy9dwNJn/Pama6C13QUaZzS1
	Q7gr1Rjw/tkouhjQ5P7vEVikJAYxjC1tfQa4lQyR0OI1YFyKiofUjk43lMbKIQaRWswaGY+ZGPs
	bOyuBCGjxBZueMPuzdGzLiSlyzx3fuWmFQnzFxiqYwpcKc6iAvkcKYZe0li4KHBlF3CgGAJtRJk
	rSaAkYASgQngWmv9KXJMURuHy+j+YjCuuw1AzjheEufPTPFqOCeRNvpumLmaLmnA3hoipe4ZlN+
	VkSxrXpc4ootHLRVC9EV0M6U91xaU/oGskNOQfClQIlmtFTwZlME0cc/kpcm7PvDXhRlad6GgQ=
	=
X-Received: by 2002:a17:90b:4c4a:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-334e0202f83mr17368830a91.11.1759222343584;
        Tue, 30 Sep 2025 01:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXUL+DTJnTcUvz3WtxyhwLy+zrlf309ULhebKSLc7QZ9CUinqJMk784kuawF8vhexarK2c6Q==
X-Received: by 2002:a17:90b:4c4a:b0:334:e020:2f16 with SMTP id 98e67ed59e1d1-334e0202f83mr17368788a91.11.1759222342771;
        Tue, 30 Sep 2025 01:52:22 -0700 (PDT)
Received: from [10.204.86.37] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-335277eb10bsm13597448a91.2.2025.09.30.01.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 01:52:22 -0700 (PDT)
Message-ID: <f3fdd6d5-5623-42aa-9342-ecec31c64a9c@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 14:22:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
From: Venkata Kota <venkata.kota@oss.qualcomm.com>
Subject: qcom: Update DSP firmware for qcs8300 platform
Autocrypt: addr=venkata.kota@oss.qualcomm.com; keydata=
 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
 tFo24aqEAzhhzFkq6qZ6FaB0f9M8wen4hRAu98k=
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gY-VkCMXiTCqZ4cBOcyDairuLlTlztjY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX2BrRY0IW3ExQ
 QA9FyHVZ/W3/eaq3ywx9ROslot4QyVK9C8XYDTa8nI/jc3gxxPDbCA94CIPrrMFRZEBTXS1wDly
 Q4KFSE+tIV7OGFBqwjW7tcqVWJ3E11Bzs51PMRsnGPh156khLRO6pWDBhrPE3KYD6z7j7VFXDB3
 p8/AA6M5B8qcgMbU0PsyaMu7wuN+xPg3ktqOGzhAfJSpsDF2wLbItHNlrtJk9KWBRl6RBZfwtih
 zTgDmiro8wtbjjhylVoqAyJgg0Bvh4ATRLySNGWOkFclS6pHIaLefEYxAubFcX0BqHiFe4oLL+i
 I2PyK5bIL1SdtytKO/nBTSjIAoAYunEidNIJlYQ9kGEcEf8DKFecb3KwVZBMCdgRhlQiJP5qFbU
 eQwytFoemeCYtLdu/IbKWFnDpmE8eA==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db9a48 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=XR6v-_ntFxsetChiJYAA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: gY-VkCMXiTCqZ4cBOcyDairuLlTlztjY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017

The following changes since commit 2725800a9b5c532fcd1bc6c1502cb4678463416d:

   Merge branch 'main' into 'main' (2025-09-29 11:56:44 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-qcs8300-dspmon-163

for you to fetch changes up to 75aab120d4551fb1beaa54444003c6d538f97183:

   qcom: Update DSP firmware for qcs8300 platform. Update adsp, cdsp0 
and gpdsp0 firmware for Qualcomm QCS8300 Platform. (2025-09-30 12:04:52 
+0530)

----------------------------------------------------------------
Venkata Kota (1):
       qcom: Update DSP firmware for qcs8300 platform. Update adsp, 
cdsp0 and gpdsp0 firmware for Qualcomm QCS8300 Platform.

  WHENCE                  |   6 +++---
  qcom/qcs8300/adsp.mbn   | Bin 6684672 -> 6692864 bytes
  qcom/qcs8300/cdsp0.mbn  | Bin 3080192 -> 3096576 bytes
  qcom/qcs8300/gpdsp0.mbn | Bin 5873664 -> 5881856 bytes
  4 files changed, 3 insertions(+), 3 deletions(-)
