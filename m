Return-Path: <SRS0=Z4Oz=BD=oss.qualcomm.com=saddam.patan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5A2EDA68F
	for <linux-firmware@archiver.kernel.org>; Tue,  3 Mar 2026 15:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 22B33C19422; Tue,  3 Mar 2026 15:55:02 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45356C116C6
	for <linux-firmware@kernel.org>; Tue,  3 Mar 2026 15:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 45356C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239nGA03349609
	for <linux-firmware@kernel.org>; Tue, 3 Mar 2026 15:55:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fwSUA0S2AqBh5PZ5axL0lw
	VSsRNzHcnhlSIkX/JrdV4=; b=CP7sNkC96PW5CImbMjz8BRMP2VUKr/KzMzwKws
	cJvj2gPHAFF+dTNLCij2bKwr/s3yw3HQ4hRwzOA69wdht54ZSAjyCPl5fYEr1pvZ
	5+Spt/MVFva7Sa1QtyByfowa/e7jv1FwdMPvIHnKdYoGIPBVWWvJmniIzpf5aDyu
	twvfUClcVnAMuWIFrKt+DaEy01RX7aOLwqPd5W0TP+A/Y1VEtg75E93qaPBQyYzo
	HXB1qGhu+KZm+C7CmBFJSVR8vyb/CEoNChrvJ1JfnM4tcdeg3leZ+gr5UoQN5xIX
	/RN1TH7W3WHjiaVBly6+Albv2jl32AGh3AKV1yloOetbWLGA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnhxsbckh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 15:54:59 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-126e8ee6227so10046235c88.0
        for <linux-firmware@kernel.org>; Tue, 03 Mar 2026 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772553299; x=1773158099; darn=kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwSUA0S2AqBh5PZ5axL0lwVSsRNzHcnhlSIkX/JrdV4=;
        b=RtBFoofY0nKhXA58I3P2g9O4qRqvs+NU7lzfgIU2x8L+d8aPStqHVwReKpJ8kh7wQu
         nkm8qJkU8An+OhBOQiMBZ7ERZFyAGZmh6kdDHf2i/2+KGPrbN6/W/Fta0JhCz1H7lka7
         heYWta5cmXVdQEwrfGLWm/gtdt0WiEDlKNlKdsNzxonP3NnPQVNeI5Mgua36uaY0mFUr
         WMtuQ+nQtg1vEJJaSyR8hFq5/H7Q5oxWn/wX05xg387dupbCKvbSBEpA0yt3+z4grkIV
         DJ6vOxxeFNN6zibWo/vSweL2i0xcbLVxHvKD/3U18Ju0jpn1PpsASLG/CaYfx0TO/UJ8
         VgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772553299; x=1773158099;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwSUA0S2AqBh5PZ5axL0lwVSsRNzHcnhlSIkX/JrdV4=;
        b=EQfYMmA0tlKqmLJgdqRusV11YcnfXRTXxX9DwNl/w8RoVEflIha32t/zEVcIjOwviH
         xVQ6hBChM+9C7fzGxRgUMWRwAeNnjgXw6WX3N1KWM6LfJUSPSSsmAbBfRmqW8ip+tPbZ
         WJyTDSdLm/2Zo/WS91KXLMtjXpwXuSyiGKSKDiMbBIprn6acxJeQ9IcItJj2Ef9qGpUQ
         LTLyXYxJNy5Aifv30lIMLyMjvABlrca6qQGJGz8cY995XHTC2ExoYKvH2HKv4dwY4XNu
         lQAioMMiHWwPYe3qf0TjCiJ5OV5DiaJJX4uN6XDrxbn/zQ1HVGLHAhDQFHvfckRT83CZ
         xDiA==
X-Gm-Message-State: AOJu0Yz/ZByETHFW5daTkfrD1D3DhTBTfXUhwbFwb+B+u/P+V3P/t/yw
	Jd0J473BaOXylm5PavjuIRYDYgJjZmzW2LlNOF6V9FsNNT/Gzqf/r+LT92LURMD2S/rZBcI63bz
	jpb8hhCwiRKOyukLwUgK9trhXg9U47g++9WZppa99TITyc41POsW+aPVmf1eWWRfleXFP4nI=
X-Gm-Gg: ATEYQzxjg0E09ume9tFkrKlprEKaN9/qFgucWOif+UTvBQjdQxDVFqlpYZTAKalmyU2
	XasLQaeMD6APconhW8BZggTR484Oxxkr/+mUFJTNb4m9J7OjVVGbGjA9ODo3+XzyjrpAkjuPimI
	q75S2jM/O1UFh5IuGMarZImDPHd8tLxzuinwlSX1tbp/Jfh4PsTpyLytZR2iL8gzxpzYRju5yU9
	nXHJWHmphMX+zsofqilOQPNnRuWixfQl+H58RWdrOY6u6E81pw3E5IwBLi54PnOjlUz/5ilgPnZ
	/R1rxqt0+Y7UYB+L7Nn1iEpX+zvdFA/f9nahaRx7StMVijiocm8DcIEviI8LdRsCZj60qzYyoN4
	Hv4wOWy+IVNSAe9FH1aDrSslriar8rfMNPEaLmj1Nq2qpd+B84kRdhZ4J0DJAhuQOfxP3AL1935
	YUhVwNbjHI53o=
X-Received: by 2002:a05:7022:4384:b0:124:9acd:3a38 with SMTP id a92af1059eb24-1278fc4dedcmr4663886c88.35.1772553298750;
        Tue, 03 Mar 2026 07:54:58 -0800 (PST)
X-Received: by 2002:a05:7022:4384:b0:124:9acd:3a38 with SMTP id a92af1059eb24-1278fc4dedcmr4663875c88.35.1772553298169;
        Tue, 03 Mar 2026 07:54:58 -0800 (PST)
Received: from ?IPV6:2401:4900:1cb5:45a1:613a:6456:f1e4:b93? ([2401:4900:1cb5:45a1:613a:6456:f1e4:b93])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43c12sm17779658c88.14.2026.03.03.07.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 07:54:57 -0800 (PST)
Message-ID: <da2e02d1-8237-409c-9f9d-1dcf9d80ae1c@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 21:24:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: venkata.kota@oss.qualcomm.com, kssb@qti.qualcomm.com
From: Saddam Patan <saddam.patan@oss.qualcomm.com>
Subject: qcom: update ADSP, CDSP firmware for sm8750 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: flWmuJSJvA3tw7vQV29Wn0VwHaBe7kYf
X-Authority-Analysis: v=2.4 cv=dfmNHHXe c=1 sm=1 tr=0 ts=69a70453 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=qC_FGOx9AAAA:8
 a=lol_4_AL-8xOz3G1Uk4A:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: flWmuJSJvA3tw7vQV29Wn0VwHaBe7kYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEyNyBTYWx0ZWRfX58ABcIKQF6RM
 HOaBNJNLC7vnk6ssAag3kUJwALDX5jufk+69NfkN0ceZd4m4Wo8ErQVEyGJKrB5s9n/PE+YO7oI
 8lq/pWA0dOpw76/4iAC0Lb+bXZD5Y4h47YwONHdtGpOFah2DRAKZ8U2+kF05m05nZqwgNVGp7tT
 RpGZUPyDcwYZwYgnahfz6JTrAsxjGIl3XnIE4Xahd40svFHOy40NrRCrTSyg2AvP9+KsTwOF0ZQ
 FUmrxIh+4ZNHdj+9hH8p4F4HePBNiS5FA44DOYR8QVvFhbeOErQ8K3AaROLgnjFCKfPMFdjOKDi
 O5qF1M8NQo7Zh3KNpf84rVPS2mZbE91vVL1AGMqXTazZGb53nFB7N+bLMUnOydETuBipOLXkqFh
 IHtK73XOJR6v4nfQJUuy5VUdu7Ae3IuCAI7gPHxeiGW+HusvD4ELn6SaDALm+iAxbu4DmoRFHgP
 08/c4Rp3lgqeAU6HwxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0 clxscore=1015
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030127

The following changes since commit d8e138dd8970ffc9f5f879e2d62938abe6cd3f22:

   Merge branch 'bt-hsp' into 'main' (2026-02-26 14:52:51 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
dsp-fw-sm8750_dsp

for you to fetch changes up to 58cb106f4dc72595c9104b69518bf5d87b76ba06:

   qcom: update ADSP, CDSP firmware for sm8750  platform (2026-03-03 
16:38:03 +0530)

----------------------------------------------------------------
Saddam Patan (1):
       qcom: update ADSP, CDSP firmware for sm8750  platform

  WHENCE                   |   4 ++--
  qcom/sm8750/adsp.mbn     | Bin 19421576 -> 19413384 bytes
  qcom/sm8750/adsp_dtb.mbn | Bin 180024 -> 180024 bytes
  qcom/sm8750/cdsp.mbn     | Bin 3912104 -> 3920296 bytes
  qcom/sm8750/cdsp_dtb.mbn | Bin 36664 -> 36664 bytes
  5 files changed, 2 insertions(+), 2 deletions(-)
