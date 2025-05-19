Return-Path: <SRS0=8a0S=YD=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457FAC2D0CD
	for <linux-firmware@archiver.kernel.org>; Mon, 19 May 2025 10:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 02820C4CEEF; Mon, 19 May 2025 10:15:37 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 68235C4CEFA
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 68235C4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JA0sUr012231
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=oI5UNr7g8Rs1iWgWF1BcQw
	zCGl3nzZITycmgkChCXPk=; b=G9bjNJ8hgz81kFM8PoikIKciQR6JXx8dJ/gL3G
	e29Y8+7DRc76JyuGnDeP2GLhz6ApKFC0e6zGit9MuEIiG9IctyVb74xq95lRmEaG
	G5bDsRP1NZWqyqrjjdrEw0cHK+BFDy34wAcYh8GgHllCmW5q1uKtEjfg9ns+WZ6N
	VKgHTpNqL6HioSIXil6d/7+Mzns77xTGWYy919U3N9lJc4ht25jc8TfF2ef1FFsY
	61H+2MVTzQYFECRWaKGPFV/1WZn0d61NKv75uYazqctTAQ8kvmZdEFf4wU60xuNH
	ZZmrRZ4LkLUVisBBV1kmqdTWfi59TMFQzLjPoVzzxcpJ/Y7Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjjsuxq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Mon, 19 May 2025 10:15:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2320502023fso17607965ad.2
        for <linux-firmware@kernel.org>; Mon, 19 May 2025 03:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747649732; x=1748254532;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oI5UNr7g8Rs1iWgWF1BcQwzCGl3nzZITycmgkChCXPk=;
        b=HXfZzH9kcb0V+rJgxQ+MR+2RXNtVwTn8kYZHlVGdoZGhTqb2CqTK7aahnU4vezfE5y
         4HzlPpRFmRLDHSe5qnYZ2cY3K5wUbERCz8YU+P6m3RtIfAaJ7UfH67/q9HpJ0KBw20m6
         OH2cil9efTmXlNA6jw5V5EX1Z/umBmzE66m5pA9lohM06bJyYkycKSOxv/bZ/Jo4pWlA
         YfupdgJqaEjvuU08z6YJgAoqNtQ/bOeJxjzZ44bumEF7n9nMpcdUvZf1SEj17zSwiwKl
         Yx9XUgZtB/Z8ToSf0FH9vHDQIXuEK6uBw3zxX/o4TEXLInciIy155gcHGUFteQLrt+Xk
         r8LA==
X-Gm-Message-State: AOJu0YwbRrTZAykv5PgCOkQvrJfdj06sxC2wf+H1SrQ4qrm+vKFHZ+84
	hdgKo21g3DSJG1IHQG3/pfN2EB3zu6q9kWo2Mb9vEF+Ibv+AUciuDfsmlwJhhQE51q4acCC4eOV
	TA1LBBcHZpN3tr2rfNuUYqEJH3uZDKxpIWdtJp6EHauShReYM+qpGPbtqpAmpXHfwhDd3vwU=
X-Gm-Gg: ASbGncuKVs8F2jXC4lcRt4PTOQ1nmKiVBMxYEe8my+Yo1t3IOoBew4C0keG7dmMacHg
	CaHZs9/kQbeB9qqIx5RvNgn5Mcd1OSQClf9t6XH5um0Wb1FbMMWQDTGUNT82ndd0vJIYosc0lCF
	07B0gwnrRadK0gsAQpO+n3bhSXQXPBPtLyHPtBzwdaaTTE0K2Avz7GluN+6Sz/h4VcSUG8A91es
	1WqK6ysgcO0sQcRJm8hXpY+4qIRkUCOzC4ADEwR3FEvS/O9dUrLUD6ho1c4v+ZKgCnIIwJMArbb
	OTjNngkYeq45L1hxGP3tiWBdMtVzIurcxddJXfuk
X-Received: by 2002:a17:903:4b4b:b0:224:a74:28d2 with SMTP id d9443c01a7336-231d452c4bbmr184534555ad.26.1747649732295;
        Mon, 19 May 2025 03:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEstcLQp0xuIFotH6qkMJggiIe6T4ZB8DPPmFhfhmF0vFAK9l9gKNr1al7+ZH5EAMY+owhQMQ==
X-Received: by 2002:a17:903:4b4b:b0:224:a74:28d2 with SMTP id d9443c01a7336-231d452c4bbmr184534205ad.26.1747649731842;
        Mon, 19 May 2025 03:15:31 -0700 (PDT)
Received: from [10.92.204.70] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e980e7sm56512755ad.108.2025.05.19.03.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:15:31 -0700 (PDT)
Message-ID: <ef16e66b-9cb8-4062-83fa-96b2aff1f0ed@oss.qualcomm.com>
Date: Mon, 19 May 2025 15:45:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com,
        Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: qcom: add QUPv3 firmware for QCM6490 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Lk8UdW4FRCHvfgILmqpOYV1KerYD2CJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA5NyBTYWx0ZWRfX1GhA01O+emu9
 hZf3eYjAFGTIXuILB1x5dI2vZmD9sR6MLxxxU87FcyL5CaS6uFeWFoH/h59Zp+ZNVnve/jQOv58
 Xy8uTsIPEN0b2kN1JBCSXF3wZZiprAo/2igYyyIfhflhlNHeEViwfuJtgqNNMsLjpIz9F045mGl
 KWjYUUbcVXAb3LJlo6RsbIp3lIBj8KMXfoIXSOeX4r5K56BXOMOrFpR6NzR/2ky4oAd3q5wQaHy
 IjjpIuSUJy8QD7RVJGW1rBUq1pLlTXwKyctgQK/3oPX8wsbzlFygRbNQRpte6JyaZ4lydhe/5go
 fQEgEyc4SbM0mnz13yW0oa2fkheZZEhbRagtlp+T4qXZS5ys2usnrlfVhkvVWjsnKsAk1pakCEw
 opz6S5752VBIFegyppqvifXQFtCSyPc877HEPOzC0nSTQ0M8oDhn2xwciEHCD0e/fhoOAvoC
X-Authority-Analysis: v=2.4 cv=K4giHzWI c=1 sm=1 tr=0 ts=682b04c5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=W5ZvLOLhO-weZVWypO0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: Lk8UdW4FRCHvfgILmqpOYV1KerYD2CJZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 mlxlogscore=537 suspectscore=0 phishscore=0
 clxscore=1011 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190097

The following changes since commit 759c4acafb4a80d76885e4a1542229a27d677322:

   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-qcm6490

for you to fetch changes up to 29f3300a797063fafd32e1ab45badc12ea81feb8:

   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-19 15:05:34 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
       qcom: add QUPv3 firmware for QCM6490 platform

  WHENCE                   |   3 ++-
  qcom/qcm6490/qupv3fw.elf | Bin 0 -> 57269 bytes
  2 files changed, 2 insertions(+), 1 deletion(-)
  create mode 100644 qcom/qcm6490/qupv3fw.elf

