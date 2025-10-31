Return-Path: <SRS0=HpTX=5I=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2FACCFA00
	for <linux-firmware@archiver.kernel.org>; Fri, 31 Oct 2025 08:16:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 549C9C4CEF1; Fri, 31 Oct 2025 08:16:38 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED7CC4CEE7
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 08:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6ED7CC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7eG7h872581
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 08:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OptXffpVcCNT+gxCi3lE95
	ld+CxfsbFyq5H2+Ap73Q0=; b=GX1rO8BsHICLnvyCPNnWMBPoDoR1tGEMmmisQD
	4O1E6/Z0VC8cLfvT/8/QF5Vh4O0+OKXTWXaHWxSlHoHaeRFM2Lf9zpGd0eVJ6uTQ
	70fBtu7UcGSMkaVUcL13nAz7xVWey2AlAc72/+RBFDZ27yPcuYLLp/JQ35oraA+/
	G0DN5v8sPpRmcM/C/LTfbX7OR0PYLz+AhnS70dGGSEkF+WuGyox476SFqAINOphe
	+VY6WRmEAwe1H8j7TaPzNitAolJCH9zadyfHH8WvZuYQvzc7kuwPFGmovObaHLWy
	OCha0T65CMaPSV7WFvz4/954dzQBsVIwHQTMTacTdQnOPjPw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn1dqq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 08:16:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2951a6cf0d2so6536045ad.0
        for <linux-firmware@kernel.org>; Fri, 31 Oct 2025 01:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761898595; x=1762503395; darn=kernel.org;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OptXffpVcCNT+gxCi3lE95ld+CxfsbFyq5H2+Ap73Q0=;
        b=fq0PxJV6Ooxl7767dNmCyo2+ng6LkRxr5+efESH9QwM1Fr3JsIBOVVJ2WbSEnSfW/o
         dTmNbUkY7tQJnqQKQOg6zwd5JEBuk/w+RGTKS5qaCBdWatgJoXTecj8du4nj1FoC96kp
         BsEYSA4ZU3s9J6btaz9dxdXtap3B26EgW9vClS8UpA4MvxJk29nkXwijgJAoSvWvbhD6
         K8ITxVnX5tkCQc0SoVHEnuJuZrQkpMrW+3QPwzpSxutBRLD2BpOJiMXhqce4zP2dZ8Gb
         BcdIbgqUD5VBdtFlGwA9RyljCsWIH2lDF6IAxM77wGkeeyl7VJyk+kIUThmG+wgJxlCY
         enSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761898595; x=1762503395;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OptXffpVcCNT+gxCi3lE95ld+CxfsbFyq5H2+Ap73Q0=;
        b=T6xFlkNjROXdOeCrD2fqmMiD1xG9T1VDnHq3ZrSPKSZbNlqXXruHYzYqdzD9ot2P94
         Ev6qWMapiZv7ZR65S6YTtLGqeX/4iHyOn9YNCx4B7sxfI09rgyNvjiA/PooL1wneMgFZ
         lodDFHWv0SJ+63tmkyHmzIiM1YDGcrrqRcvnX809+HxqxnxRjL8YGS3gM4b7UDnhNrVU
         T/WiKa5pPtgXTjUkpZo1N0HXv1D+5IPc5e9+MiVdH/p84AUjgjEms7swfAGjJ02moE/x
         vU0IzKHQ2iCwSKbnb+JRfP90fQZHYnRD/4dfN2beEioJE6FyS2mXyIm78n03nv5Exm1u
         Otkw==
X-Gm-Message-State: AOJu0Yzy+9y7ENjrclRjoR+uH/JS5f/zFbY9ZD8vXtlI2vOrPd7vYF15
	J7ITX8ABVrd7yaAVhFBDo9KLuhjo+04atVWq18JaCrJnUedn9Qy0qMjQUlYV0pxwokWOPXEyJqx
	xppJfvFpFoNGjD2NzQfdV5CJxK2bC3yHgMjet8hzzmrumDA7nAAy174S26hpbEPHrll58YYo=
X-Gm-Gg: ASbGnctjMnJ0dBp7c9v6W9SkGDBTwFwL3tKegvAzJfZh+1EODBGx/anSBMc08Iiuvo3
	CDLPONZDjKlpOQlJBBau9e7PqH5zwlMV5sq9iSzgnNXpjOeMhFia9lqOflVfhqzVbTERia5KAxi
	QVGLlfrgpRzyp04CEKQrzolrDbDKoSlu7gq+oamJ3zIPdeByzSsvIJWmDty8Ge0VA5SrE85FVa/
	MxQo50JefcvlDJHzQN+AI8HRBZEEQmn0F52uaynYqpS1ECuKCyhRKpF52UAzJc5pUQ1Za8ER3Au
	GjU0f2xI9bxbVMNgYGkkkI2ELyjS3wJnbuIyri0daVvqOpdkay/xXs35vpAF+NfnSicrED64qyB
	2xSanBaCdM8u3Qql/Z9xrvCE2loBgrj7v+0TCS5Ky+Yll9k5oqyJ54hskE/y16a8=
X-Received: by 2002:a17:902:db06:b0:295:250e:6c40 with SMTP id d9443c01a7336-295250e6f51mr22984495ad.55.1761898595389;
        Fri, 31 Oct 2025 01:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKUU+MZcCOHZ6sFUN0u/Rpcnnqq7DACnD1c9//cPKIQQDUSUJlgx8gmUio+3EcJ0qT3vUEFw==
X-Received: by 2002:a17:902:db06:b0:295:250e:6c40 with SMTP id d9443c01a7336-295250e6f51mr22984155ad.55.1761898594803;
        Fri, 31 Oct 2025 01:16:34 -0700 (PDT)
Received: from [10.133.33.55] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952699b603sm14516075ad.79.2025.10.31.01.16.33
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:16:34 -0700 (PDT)
Message-ID: <2c54ba08-67b4-4bb2-926b-de0e7cdd47bc@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 16:16:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add SOCCP firmware for kaanapali platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=69047064 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=qC_FGOx9AAAA:8 a=ghD5qXBfC8u3sMtTq0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: ao2exaSXC1e4NuofZL6x4RFwsgMPYZbA
X-Proofpoint-GUID: ao2exaSXC1e4NuofZL6x4RFwsgMPYZbA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA3NCBTYWx0ZWRfXxCOn6LHFg1Uo
 KWiB2R5SX6cV+kqDmS4jAS7cvhqDz5A1eugmn/MFuyvzUdekeGfRMzSNOIrWkvJdwgoNiyhfs40
 T8MW/PME4qXp7Uc1aboVWPWi9EEOAseGNS6yyH4OJwSDu9N50VecochyfjOTsCrTHHSBpgaOVIk
 aDEMJQGhqI1DrJemFnxkvJnRrhTmvjSllvA9yPMkj94IsEXQHMSK/O5b4wnOStkWicej5oYSLvr
 aetO4gZ5s3j3lGSuaiNh3gsoUsyLXs3RHFtPl9vq27WYALa6qt/xyVMg8PIJbFlEE4q5CLQtqTS
 CoJioWLqdTW4VHwpTNyZMA+7TbMlR5Rbx6oL0rmVHa+DYzgdY/mgJSTe3TQgJsNF4Ll00dzDVon
 a4senWkTblSpt3t0UaATvfYJd8oVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310074

The following changes since commit 7234d25d1884114901070a9c42380e104e48a136:

   Merge branch 'amd-ucode' into 'main' (2025-10-31 05:05:13 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git soccp-knp

for you to fetch changes up to 90db1091087d0cc4af93160c0a52312738515174:

   qcom: add SOCCP firmware for kaanapali platform (2025-10-31 16:08:38 
+0800)

----------------------------------------------------------------
Xin Liu (1):
       qcom: add SOCCP firmware for kaanapali platform

  WHENCE                       |   4 ++++
  qcom/kaanapali/soccp.mbn     | Bin 0 -> 2359480 bytes
  qcom/kaanapali/soccp_dtb.mbn | Bin 0 -> 94008 bytes
  qcom/kaanapali/soccpr.jsn    |  14 ++++++++++++++
  4 files changed, 18 insertions(+)
  create mode 100644 qcom/kaanapali/soccp.mbn
  create mode 100644 qcom/kaanapali/soccp_dtb.mbn
  create mode 100644 qcom/kaanapali/soccpr.jsn
liuxin@cse-cd02-lnx:/local/mnt2/workspace/lx/linux-firmware$ ls -al 
qcom/kaanapali/
adsp_dtb.mbn      adsp.mbn          adspr.jsn         adsps.jsn     
  adspua.jsn        adspuo.jsn        cdsp_dtb.mbn cdsp.mbn          
cdspr.jsn         gen80200_zap.mbn soccp_dtb.mbn     soccp.mbn        
  soccpr.jsn
liuxin@cse-cd02-lnx:/local/mnt2/workspace/lx/linux-firmware$ ls -al 
qcom/kaanapali/soccp*
-rw-r--r-- 1 liuxin users   94008 Oct 10 09:49 qcom/kaanapali/soccp_dtb.mbn
-rw-r--r-- 1 liuxin users 2359480 Oct 10 09:49 qcom/kaanapali/soccp.mbn
-rw-r--r-- 1 liuxin users     248 Oct 10 09:49 qcom/kaanapali/soccpr.jsn

