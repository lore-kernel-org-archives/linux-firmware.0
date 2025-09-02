Return-Path: <SRS0=GMwi=3N=oss.qualcomm.com=xin.liu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89274CA1005
	for <linux-firmware@archiver.kernel.org>; Tue,  2 Sep 2025 06:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63649C4CEF6; Tue,  2 Sep 2025 06:11:54 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5D874C4CEED
	for <linux-firmware@kernel.org>; Tue,  2 Sep 2025 06:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5D874C4CEED
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5822RoZ0024999
	for <linux-firmware@kernel.org>; Tue, 2 Sep 2025 06:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Cw+YV64MJzMkYFircOIAKG
	FC3r3w+R9oK0ZMgWMRK0Y=; b=iPf8Z9Ov+RWDY6qorN0rqOCX/HhWgrRIBYSk9e
	WEVrVPvrD+6hd7Fknx4nvabKvjp1PCT2dAgKiVKorFoqG+IJS9jShUMYVi+OpSjl
	jlEvgKhE8R7cijePq2LuVRBLiunqN/6zd8jrDjfO2fliOBYA0QUxqG+hB9TNPfzd
	WqljmGM681/2aemTMHcLAa60qrfx/Hvwa116E9nBlqSS2nHhTjHZZEr29OVktCFl
	O8xHuEC7G7Q2owJiu1EpAGZxIMywHj4cg84omhxZGj1bDfEY1EThfBrRuThlnqPr
	OU/pYi3wVRrKJmtKqpzD5AI3WtIUw8h6FIPrWlToCFm9u/jg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscuxrhd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Tue, 02 Sep 2025 06:11:51 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7724ff1200eso1641795b3a.0
        for <linux-firmware@kernel.org>; Mon, 01 Sep 2025 23:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756793510; x=1757398310;
        h=content-transfer-encoding:subject:from:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cw+YV64MJzMkYFircOIAKGFC3r3w+R9oK0ZMgWMRK0Y=;
        b=DFa9CyV6Vo9ftbQX79qD2416nz6cCxmpx4xGBKIFG9QDS5oU9zMwoe2PYQW7R98Oau
         RmMZqNuWWbCKqI/i/DxnVipSypHiqwDTrlKqKz2zFpkogAkDe9fHAYuAOPOay5bcPxxo
         IrtWcXkqd9vGbU9BRvXq5OkONisjhZ1zDwbOo5dPoDn5qYFZso+W3b9yun2emPUsfEI8
         meho2J7kroOLouJ1N5yfCEmsQ3geAedc7Z6CZFuWCmNnG3sGkC/7EOebozA6mPA4Pesx
         cTr4BgatG6YS43R23i73+ONBQPGpHPDJs8nY5gTM+vgqbLgTs1aMj34W40t7iZiBb6Gf
         WwHA==
X-Gm-Message-State: AOJu0YyffENGNHzPkqpuvlSgTaDi7YrFO4mq5Z51dKS1DuIL21x31sMR
	TAKyvTnMb0w2/Pg4NAOMAYDpc43AypF3kEirws1oFeuIjCbgj3Zs8d5GZp2JmTHyQ20zgUAH03A
	k8TXNQqwkolhnj6U9xfSmCuFFQly7BL9pgzRmTOBi4ZFibJjJqRzBUBi3RsbUAEc0hXMiwe4=
X-Gm-Gg: ASbGncvjvuB1xjJgW6cLtEylw1dP5qz4t9T9re2pveW+0TILKOUOGaanG7HT1Huyy7R
	Nv2s84j7F/KpWNFj66mWgSMPTsVjs8BGnkM0nG9b/SjYIlIdCEK9NT4vOcGHW5b3Jf8J+CQaCxS
	ngacilFZU5nUWIqBoRFlN4EMcMtTkOuyTFNJCN2ODGzaeRHkYvIZg38JNZasdQyuip/EE7OwTgr
	7eVRFHwCTlRfTSbd//6JgjFZF4nr28W6e5xtuIrjOctVzixWjsMvGNNo6q8i3G+a2uKgijOwYpT
	HL+WKbP/WBJSyum0ZGlH3bH9xYwWQXz8Qg05FQkhB6M/7pBe8KtySNlXfKhYQk/Hcr1hdSG+yHa
	qUxCIjPdS2jgCIsjSNyNCP3EAXxzRdw==
X-Received: by 2002:a05:6a00:230a:b0:771:e908:b573 with SMTP id d2e1a72fcca58-7723e40338cmr13013277b3a.31.1756793509679;
        Mon, 01 Sep 2025 23:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCqsXqWuVYjFqV5h+vry5aYOMiZrITXV79/5/Y3sDat9NYLGdbRLF94A3zNXQHwVgJizxBow==
X-Received: by 2002:a05:6a00:230a:b0:771:e908:b573 with SMTP id d2e1a72fcca58-7723e40338cmr13013254b3a.31.1756793509170;
        Mon, 01 Sep 2025 23:11:49 -0700 (PDT)
Received: from [10.133.33.254] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7726c1ed65bsm1846791b3a.45.2025.09.01.23.11.48
        for <linux-firmware@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 23:11:48 -0700 (PDT)
Message-ID: <e4f6c65d-bf1f-4af7-a64f-f30cccdaaa3a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:11:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
List-Id: <linux-firmware.lore.kernel.org>
To: linux-firmware@kernel.org
From: Xin Liu <xin.liu@oss.qualcomm.com>
Subject: qcom: add ADSP firmware for qcs615 platform
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX6FCqXJ3PtnZw
 NXaVQHISQzLHMefmnB6IQSscN23CTty+VxtBaQ/YmRJ6KbA4SXk8vo5iyeehzn9mKR+mJt/24xa
 KrHWMLrqbi0axaX3SzFIGKm0BSsBgDxyiXed++mrqtioJvxw+nO3csyh0OWhgeVPLGtPYzXSQt4
 BvHNB7bvK3KnLSOfk8NGU3sEMjmrzjuWDp1ZN780ub0oOS3Z8q8if47JpXY1T5qVydn30dyA2pn
 DSZ1a/qt6CjF9X2AsEbA7glxjav6AF2s15cWjmShkBl7H5GUIABPp5h8BViSx36QtMlxaFeUJKN
 3iXsTMEh9oeH2uJoIPnPxiXtm7LPYaWZ8HkfNyaeD6Ej2DyJ4aov7XQ38my9F3JQUlbJxywG0nH
 8VJskuHn
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b68aa7 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=qC_FGOx9AAAA:8 a=Fc0We2lyGCUpdAXhAOMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: UdhewKYephldoXClZSltxWptLh9YrvE6
X-Proofpoint-GUID: UdhewKYephldoXClZSltxWptLh9YrvE6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_01,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

The following changes since commit 993ff19b553cd4d252fdf99f07c28825ef57b862:

   Merge branch 'main' into 'main' (2025-08-29 17:13:10 +0000)

are available in the Git repository at:

   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git 
qcs615-adsp-91

for you to fetch changes up to 7aeff2162e6bb1875cabcf26caba01264194768e:

   qcom: add ADSP firmware for qcs615 platform (2025-09-01 11:00:40 +0800)

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
  create mode 100644 qcom/qcs615/adspr.jsn
  create mode 100644 qcom/qcs615/adsps.jsn
  create mode 100644 qcom/qcs615/adspua.jsn

