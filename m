Return-Path: <SRS0=HEMl=3H=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09807CA0FF0
	for <linux-firmware@archiver.kernel.org>; Wed, 27 Aug 2025 02:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1F65C4CEF4; Wed, 27 Aug 2025 02:57:20 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07DD4C4CEF1
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 02:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07DD4C4CEF1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJP4tq007563
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 02:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xjBIfS8AVaLuaB16Tck6y6
	m+RTr5hsrISNEiMjLIRm4=; b=OjIok/8G+AwrnKwOqOjHC5nL3BYgXr9DLTfV5l
	mhrx0MnRr4FAI5HJ5wq/0vS+n+jbpwGe3DtjHQ6D11WH422GXf3pksV+jGwK0UVq
	zAsWYr+5hYhyOCdWTjvSn94kqcFinex6mvLpdSduIP49GaKErLGFOJzDMYyguAqZ
	A56zSDJDs17fyQBFc0x91LQWLDh1lQq/CKITZguO5n19ApbmxIz8vrL4GyYjhEmz
	6PqcbN+DW6Rz7fT+/9ncgUx1+no3NW/KmCfZZDG46u3y/Rm8QsEjKzi5u/cjSfXL
	xeE5/ls5oHOMEsDy2FtetNb2gu0lQulcCj709ejNdrpVcFLQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8b8gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Wed, 27 Aug 2025 02:57:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771e1451631so5594897b3a.1
        for <linux-firmware@kernel.org>; Tue, 26 Aug 2025 19:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756263438; x=1756868238;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjBIfS8AVaLuaB16Tck6y6m+RTr5hsrISNEiMjLIRm4=;
        b=sx4NzXjm5E6J2aUfc/j7I7dkxlffriL/1tsOsEa2Kcls1AYlpBKRI/AXOcX74Skk/S
         XKyZg2fcPar3mX0qrgQ9nI68SdjTA7igcdvGShP8EotDks8XIBg+56aObci9fHXQ9noN
         Qho2YJvpPc3ihEgCPe/cc31jvK67YVRWt+LI/IBKMawLtK+qQ4LUu6D0h6NghxFgZmFr
         CBsDqFSHhhnee6+rFE17uuqoyTWP7Ncdx77C3xS1jrrVAnyEuE8rOAcQyH1pNeYN88dg
         SGuvnNTfW9MkmRkJSV8OSu/6+JMSSboj59tIgfcrFh+5bIIbD9d7mN22DAcHkQ/sSJZN
         oK3w==
X-Gm-Message-State: AOJu0YzlEZ9lFFeEzRUl/3E7e3XI8eqvOY8wFxKh36SdYzVBJOr6xtmK
	6EMkKpWCEZJSwfDUzbsPCvpMRp7PzYN5jFY4XxAwY4sVWcof7Bl6FXmFnW6Y+S34wY7lGejBxMk
	GOAOihOHa3dE/QUF+zVXRh7hhEAQoF0K0d2J4ouCntdfVYlQhblSAxaBRocUyaVLNdEOJ7Eg=
X-Gm-Gg: ASbGncuGozaasNE3hq6eFtM40QG1Q9asttKx5iMRBkSuKRp1HDyQ8JfjQ50YoxFQ2Cp
	YCG2IqpGijXlXHJVWCNN/VkVhgGuprNV+Vd+klQ8o33EZKMXRjBkHnfFk+xUYWwtxhqpoHxEXDS
	8EoiHSxTfGLcF77WMICko56Tekysga5ijWexefiCqFc9yCRtO6nFO5GbQYiWaDHbC9HiHthHAIj
	F87vp4niboV4de3XPsBHCzechK8vIbqKhMaGpOy8JU605hOZNftU3ipOnsooOruO7crQ6g/p1eY
	a4r0CmSHa31iH4MaX3fw56Z4XGTDVEhbz917YRAh59qVIuPnL7/p8v3kNE3CCrrF2mn7CHFY4cQ
	RaouCMjf3h7cUL/iWS0t7XJhqIeeuVQ==
X-Received: by 2002:a05:6a21:6d86:b0:240:1c56:6495 with SMTP id adf61e73a8af0-24340b016f3mr29571912637.14.1756263438285;
        Tue, 26 Aug 2025 19:57:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSKWAm8+63G6sopUTEMqwUj5avPU6k4CysOsWqWLm3cN+cCNBPfNZNcL2AyiueKrQSi8/Ymg==
X-Received: by 2002:a05:6a21:6d86:b0:240:1c56:6495 with SMTP id adf61e73a8af0-24340b016f3mr29571886637.14.1756263437793;
        Tue, 26 Aug 2025 19:57:17 -0700 (PDT)
Received: from [10.133.33.156] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49cb8918e7sm10398598a12.6.2025.08.26.19.57.16
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 19:57:17 -0700 (PDT)
Message-ID: <783737b1-05fd-41ad-9bbf-8d0e601f3b08@oss.qualcomm.com>
Date: Wed, 27 Aug 2025 10:57:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: HD0cIRUhabp9YDkWGocfRvuOAKgWWWe9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX7UylVYK1uY2V
 WIkm0TM8TJhDQKSs9fraPdch3tMqxOlHx0EU6XzSnbV1mcSWGeJPAjp0kaYNt7K/A4NXjgdOOrT
 UIsKSFoP4jk7U8A/tByfIRpNNx5K9k4zfu3OjqHLkBXI542XGjqBpZEQ7ZZpn5jsExZ/jjVSTQM
 avgB0dliAKYqQNbZcHKa+nyIPuMZTwCjIs0gAm/4862Y/gTIwFP+WnjCk8uyaEZpWrmh4qPJ5jO
 4hOAzyC5CJsv2+pq3PauOXVRGLTfz7mHt+xrIsLfT1gIrujlR4uPVZJH8sG6yzpOMuZvAfnZ6CI
 J9xHvych5nvUER0fpq6yjiW9Ob8zfXzxkgJ6ZVrtY+VfGc9uPneFMjZbxQe9yhF6dEhW4lO6s/s
 Sd81zTKu
X-Proofpoint-GUID: HD0cIRUhabp9YDkWGocfRvuOAKgWWWe9
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68ae740f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=qC_FGOx9AAAA:8 a=HESygnTG5RWgVPuGtsQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044

The following changes since commit f044bc789f8e7a4427593b687801644c39e3e8b7:

   Merge branch 'amd-isp-staging' into 'main' (2025-08-25 18:22:13 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-adsp-827

for you to fetch changes up to 542611790f77a67a6a24c08d087d22585caa5ac2:

   qcom: add ADSP firmware for qcs615 platform (2025-08-27 10:46:24 +0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add ADSP firmware for qcs615 platform

  WHENCE                 |   5 +++++
  qcom/qcs615/adsp.mbn   | Bin 0 -> 8536204 bytes
  qcom/qcs615/adspr.jsn  |  21 +++++++++++++++++++++
  qcom/qcs615/adsps.jsn  |  21 +++++++++++++++++++++
  qcom/qcs615/adspua.jsn |  27 +++++++++++++++++++++++++++
  5 files changed, 74 insertions(+)
  create mode 100644 qcom/qcs615/adsp.mbn
  create mode 100755 qcom/qcs615/adspr.jsn
  create mode 100755 qcom/qcs615/adsps.jsn
  create mode 100755 qcom/qcs615/adspua.jsn

