Return-Path: <SRS0=W+U4=YE=oss.qualcomm.com=viken.dadhaniya@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225E7C3ABDD
	for <linux-firmware@archiver.kernel.org>; Tue, 20 May 2025 07:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2F67C4CEEF; Tue, 20 May 2025 07:21:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7589C4CEE9
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7589C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K3m2ds021268
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3Cqu2N2vb8yFZ0Ai5ZHU4B
	ZWjpibcFekjLK6KGI3m1U=; b=Wieu9fDDIvrStShP0c4pEh8F404WwY6uLFGVMm
	ymrVDXHx4gETSzKrWmKAp989b50oxhnYnR63TuEf4QTbohdAhOaRIIpSXaxP4TOd
	TGjO0uB6ig3j0GMaEX8q4Khkb6imKn7tXuTbivhAlnDkh6ehLQqs+//vWTTj/eLs
	CDWapclGCcylC9ZJUQdzR/UC2MIcBPtNI7WjAohnbniV+/GFQUtPdku/4BCHSzXC
	xUU6pgeOFhw7ZL3zw3s3od1NyTGoWdNXeGaSPB2D9NNup/iYT2S/8BdipYeFp1ZA
	9+RqcS7jllNWchjzuXag7P6+K+L+n0GTyEehBbRcR3tFwOew==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyt4q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 20 May 2025 07:21:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2318043effaso58120695ad.1
        for <linux-firmware@kernel.org>; Tue, 20 May 2025 00:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747725711; x=1748330511;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3Cqu2N2vb8yFZ0Ai5ZHU4BZWjpibcFekjLK6KGI3m1U=;
        b=hjAJTFr51HgQmP4XJ+BhVhFNzsCxpuFJlx/dwry0WQuc/kiJotrZvUEvYIh+cB5APN
         pFWYWlx/droFOIO3CTnQsOO8Qmy/P2C2RoCoO9VlEldNLCqkjtmf+rotiLj7OaH7bbHK
         nqHxcPwnP/zJMcNlNYmorb8DrsT6huJ3kXolQw7jExEMxrX2kesXk9CMiDTABmcyomZ2
         HkMuI+JjkH9rdvuvo/wSu99HawV3E27KGfyMLo4l7DzE3z5Uezt3b7/OWehj+fJdwLUI
         RiS1K1SKnVnRPH3kKGKQ0m/83s1/B1VyCLT7E9re39vxUz4/o4tdIRDwEkQ1ftIxMgpX
         K/Zg==
X-Gm-Message-State: AOJu0Ywe+FB9MVjjYM95t3MacqC+uAkGlfjQRZscc+3WUSyzhFoRpRwr
	/yANrLkbZAR3e+UN9GPjjaXNbM8pij2CI8nflnzAIJw8yZBe/ojbYSnzDtTMn6775UUMbgEw0NT
	86eYRcjwpl83jZI+vCACYL0PL/A81/NxsQUXWqIVN3kHsUQhmrbSFM4pAvmm2apbdOkApTY4=
X-Gm-Gg: ASbGnctcdpTLIhwZ1k52mhVXN2B2UOddc3nCYpg7fcBD8S7e0h5f6+Yp4XuxkhEcm09
	+BTgbsN7kANdtMmlmlXSV0+m/J1oaLJYmi75Ko/eFGMsvEaWBx1J4JcQm5XTKVt2NdBnGgttzdJ
	hthIYLgpANmIQPZQmQFx3OdWcSy8mEB1TAOexFefx9OS4GKjuJ+MImQ3jVq4YkEgzvTuGzFCIQc
	lbG8fMFgl6tATBtjU7rdt5sTj4VlZ8FFLa0ieukcCWu0LLdd3hzMcq8dVHs33OHoO0leCfoW2M5
	mXM+aJQxqO4RWYuzMU0OULmZdSjeH4rYNpaRWohyftWP
X-Received: by 2002:a17:902:cecd:b0:220:f59b:6e6 with SMTP id d9443c01a7336-231d438b707mr200339405ad.8.1747725710781;
        Tue, 20 May 2025 00:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIGFDUpx18/2xO8zqrYeTvlxaKAbwTK+JPvRx2u5s+Ymsx+Y1wA0EB5dbxJ1t2k1PBIMT/PA==
X-Received: by 2002:a17:902:cecd:b0:220:f59b:6e6 with SMTP id d9443c01a7336-231d438b707mr200339155ad.8.1747725710411;
        Tue, 20 May 2025 00:21:50 -0700 (PDT)
Received: from [192.168.0.105] ([49.205.255.212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e97f9bsm70586515ad.156.2025.05.20.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 00:21:50 -0700 (PDT)
Message-ID: <7b30419d-e801-44a3-86a4-b18da83ad066@oss.qualcomm.com>
Date: Tue, 20 May 2025 12:51:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, quic_anupkulk@quicinc.com
From: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Subject: qcom: add QUPv3 firmware for QCM6490 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682c2d90 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=4V33KkNKHzWXINH6/GgMzQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=W5ZvLOLhO-weZVWypO0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA1OSBTYWx0ZWRfX8abk/39a9GDg
 LImNh4oK/sCZyNQpwpQSUMuohp2KIEHw35hAvzMMrLzxqxK8WIfKJwFhWw+VwOS/O5eVEjPOWVy
 fgVRDlVUL1kKoQO7VGo/GsMUVPxHWTA/gfj9g7H/udIWGldUAuamBoy4XWQ2MWz2j4itZ7e2Wr7
 kqaQKyev1XoGT/+UE+ddMBUL4DFZhtNKcV1aBweAy2mYJAxQ8FnCRMRGHW9NR8dBSpnPkogvqdx
 L+vZ5m7uDeQ0qU4npMzcE/pb7eRmmD47OJ37jJzYMn/NGt5W8dyzOR8zJfyXTEjhYltzKuZuHzw
 nXJj95bMlhP/hZwLmS8A5bvu1TnEqGVsmsQypSxLatLnJpLClLQZTlm4ALrLyjdKkPxKoI7NApt
 wvclwEQxzAnic7Aoh682h11vnmgvv8QczeJhLBAcossJ1WK8BjEXuWZoXvUCEtEy9NRg8OnD
X-Proofpoint-ORIG-GUID: tgJ_LYeYitgyN06yb265Ua2BFyiFPtuk
X-Proofpoint-GUID: tgJ_LYeYitgyN06yb265Ua2BFyiFPtuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=539 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200059

The following changes since commit 759c4acafb4a80d76885e4a1542229a27d677322:

   Merge branch 'robot/pr-0-1747425243' into 'main' (2025-05-16 19:59:07 
+0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-qcm6490

for you to fetch changes up to be949ef4113e8dfabafae6313f6bbe88520f483e:

   qcom: add QUPv3 firmware for QCM6490 platform (2025-05-20 12:07:53 +0530)

----------------------------------------------------------------
Viken Dadhaniya (1):
       qcom: add QUPv3 firmware for QCM6490 platform

  WHENCE                   |   3 ++-
  qcom/qcm6490/qupv3fw.elf | Bin 0 -> 57269 bytes
  2 files changed, 2 insertions(+), 1 deletion(-)
  create mode 100644 qcom/qcm6490/qupv3fw.elf

