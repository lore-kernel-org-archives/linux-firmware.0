Return-Path: <SRS0=kJMq=CC=oss.qualcomm.com=xueyao.an@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B37E7E360
	for <linux-firmware@archiver.kernel.org>; Fri,  3 Apr 2026 09:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9C5DC19423; Fri,  3 Apr 2026 09:51:24 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 08342C4CEF7
	for <linux-firmware@kernel.org>; Fri,  3 Apr 2026 09:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 08342C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336adJo948009
	for <linux-firmware@kernel.org>; Fri, 3 Apr 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yODj/d23A+LPTUXmQqCMUz
	RuCH/TvoY8YE7s1k8tPnM=; b=HiWGhzc280yPkYkscRE0pTWXnC+UO7QEF2FtKu
	ti85yzZwP0Bvt6MWkwSAvmJALgk5YKfUqMV4G5+i9D4XOrs8LEjU+/PVSic6N1cd
	SWiAyeXM1FCPEKLZWuLAu0ukGQEDgbiRyib6v63aTGNo+gaxpWFNCM8dzbhvcLmR
	wT/fC57tLzlspwtm22BeI3UYMPo/CcWjzi8H2G5HCTnXoTQ9HBVq6fIaqvd8PdH0
	cOT4kBGv/HvF4Pe/7ky1dZ8zk4UHPBPAq1NGCYR8WhDCG4C2dpIrhL4dlg/0XqwX
	n2IjulRHkhLkYqNJMzla5fxbcytI4p4cMaNo86yNUQda7L/w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfj4jy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Fri, 03 Apr 2026 09:51:22 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3595485abbbso2215733a91.2
        for <linux-firmware@kernel.org>; Fri, 03 Apr 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775209882; x=1775814682; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yODj/d23A+LPTUXmQqCMUzRuCH/TvoY8YE7s1k8tPnM=;
        b=UvvWDMKa0Vdk2rxgkc/z7vO8I0cwTOztWmKZlblOVBsQdDOI5qfgKd2iTM3obcewAe
         SMVaoG5RqXR0tYTVtAKjS8K9+SgUVXmF8VTxkGpPLpwV5E+OofmkCiIU5covxcekASsP
         PD161tnIiWFM1LQq6Q2e1lGILlTalsWsYc9zqDirvjMdAVbkfapE7T6AsV3kRGUTWJaK
         mAjNqJMcD3F1dBnLBOWQrHVw0j9K1z/JWiH5V5sxbyelS3CeKcHx2nVFD6HzyG4tEWqu
         /51goY+sU3q8hq3S5k2W/FMzcolpnOyJBRx5VYDz78ip5hrGscPwhqJB+rMgbnAO50MI
         FRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775209882; x=1775814682;
        h=content-transfer-encoding:subject:from:cc:to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yODj/d23A+LPTUXmQqCMUzRuCH/TvoY8YE7s1k8tPnM=;
        b=aI9YVJnhJlYtHPUicMtVVkk3AkJW/WpzPIqz9ixDBIZvLBjAjbyW1cZke4dXd47pfs
         gagFqHZg4Bkg1pR16EWlnraxEuSZW/+ok9J1AX7dm/W8DKb75yYtyPWSQ7lrAhXslJI2
         t1kbF/vN4TPP8zN/lntZ/OLP8NPWqUcUuivobt6DF7hTvTC/TAY8lRc8Vl1s40IWpRLG
         UBRXG3DYEdSNNiAAlJ4dAj3+YeI5Fc2jw2s7XWsiX8xCH3OQndGf8B4pS3j/soqrXCds
         DVet9dGUhkrwVjWqF6z9RVBnbS1zVbV4L6YnHhumfqS5feuo0as3fwBT6EW9f7PCAEga
         AgPA==
X-Gm-Message-State: AOJu0YwF7J/MhXrOUYJTQmbA8gxLo1LMlKETaP34/wDBzbcnGlFLo3WQ
	eiW4MuR688/qDzZyN4Rlhk911OHxM5DsWeEI6ecn0Sub5v+iFKGZPfxvqFPDShpF2eDMm4C4OYA
	MmeUlmO6aeTYq5FD8v5cG0fMMzpK1wiU0ndE/GpNJQLc7yJVESp9v4MtcnyrdZFXvzR/sYQE=
X-Gm-Gg: AeBDievl9xSIJKApl4miZTZ5dysR8t06DLCjEy7btsWnn3VUQeiSKKoNbioodWvbHz2
	nHcpExA+M/vrrNltspji6Nk8YNGkuUdM0foIgvg39tUAYdppAn9mOGoc6xWDRo0EloSFeBOF/YW
	N3fS/BJvLteTX13mydTE2PSa4TtXZi2xWnIUvDEd2rsqDSSpHzw+dxtKSTJQH3PzO2TCEnX1U6e
	OLsOla5RXA0IPfHmmeW37mbqOimeOZIROibqTU+sh6eoU1nHgjXGyaWqvyavXG0GuWRWb6ouUH4
	/AbJGm5mz2CyXahJ69N/vh+ozeZOFC+B5qhAX8EP2PF5xYesJW+AYppb+FfnXRCIgIjZfKOOP5T
	R9Bes8wDlOLlEZjR8Jp+dcpCT69++aKNoKzJp4+dyWluD
X-Received: by 2002:a17:90b:1c09:b0:35d:974d:8f3 with SMTP id 98e67ed59e1d1-35de6976958mr1937327a91.15.1775209882072;
        Fri, 03 Apr 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a17:90b:1c09:b0:35d:974d:8f3 with SMTP id 98e67ed59e1d1-35de6976958mr1937312a91.15.1775209881572;
        Fri, 03 Apr 2026 02:51:21 -0700 (PDT)
Received: from [10.64.71.160] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35ddb973ffasm4061626a91.2.2026.04.03.02.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 02:51:21 -0700 (PDT)
Message-ID: <a1f342b5-1c8d-44ee-8091-a0ac9b5398e7@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 17:51:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
Cc: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        viken.dadhaniya@oss.qualcomm.com
From: Xueyao An <xueyao.an@oss.qualcomm.com>
Subject: Shikra Linux-firmware: qupv3fw.elf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eiDzEMvYxFc4juyPqno0dcLoR6CTKpXD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4NyBTYWx0ZWRfX5OxepcZQCTzu
 omr0hLmRTHLTGOxsHP3xP96rQqD5YArYgu2pfvm3yTsfVxFcPAqcy2z1liG0Q8GsICBRcPb/kde
 aNM7g25CUcGyjxuF8YUDyFXWdxTTkAi0KQkbcYrF47i3G7Sbx1zCu8g9idYAcJzT7AgVPi+55/s
 1TYMQleztQbie/yq95oYnKgST4FkAXpThimHIB+kuUjrwLiylo7F0Db1/t4Ka1s2LrKwx+dvE2k
 vxeMkIUnG3WBGUQ8f7W6Pj+fEdlNSp8Xk+CHVRC46TUKSSzxe3ptl9DTyy94SuLaPmdNycXxk7a
 NtaWCBDVFAcqZ0iuBFMFOSW/LIIpc8YCWJSoDAM0zPOJ8OmAKeOvUXDjQAWfJgwBw3F9Ld+0CmE
 bkM4pOiBkRv3es7K0DShrxx0NN6slW5dygbJYzPEvvy88U+nUMyeUQF20OB5I0kRMKBJU5YgiHx
 RyhhfaqtnR6mpM4iZNw==
X-Proofpoint-ORIG-GUID: eiDzEMvYxFc4juyPqno0dcLoR6CTKpXD
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69cf8d9b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qC_FGOx9AAAA:8 a=CL3Ls6F1XLulrIJUaR8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030087

The following changes since commit 583d336ee7c2a15fd9e92c223b147d30737ec04f:

   Merge branch 'intel/guc-v70600' into 'main' (2026-04-02 18:58:02 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qupv3-fw-shikra

for you to fetch changes up to 461b77109feca42e38bdb0745dbcfd1bed63825c:

   qcom: add QUPv3 firmware for shikra (2026-04-03 17:03:56 +0800)

----------------------------------------------------------------
Xueyao An (1):
       qcom: add QUPv3 firmware for shikra

  WHENCE                  |   1 +
  qcom/shikra/qupv3fw.elf | Bin 0 -> 46600 bytes
  2 files changed, 1 insertion(+)
  create mode 100644 qcom/shikra/qupv3fw.elf

