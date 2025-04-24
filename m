Return-Path: <SRS0=c9Fm=XK=oss.qualcomm.com=dmitry.baryshkov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9208BC369D1
	for <linux-firmware@archiver.kernel.org>; Thu, 24 Apr 2025 10:43:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B036C4CEE4; Thu, 24 Apr 2025 10:43:07 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A74AC4CEE3
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A74AC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OAeC1N008997
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z6N1FQIC1Lzm+p6GnhvFs0n6
	BWeNky1KVyUhdKrdCk0=; b=doEwreH8sLA4xl2QBNjukUXfOfseNJx0xdYX8IKx
	azYhQVvF+E+Pjvelg1mYYAs6bIqAUixr3V8Dcl4X8jXuI5lCBUL35WWHjgpNh/8Z
	t21nFoMMmrGrsU3tyjRmhHBXyXH8RlOqYAkzlOf/G7UwWckB/OA0i6rCodlSq4AT
	9fnSA10lZRZxFFu9D8P2X+I0iuTaGjiCgWj8QLcHT98fU14bWE3dG43Z+zJOLs1e
	0IAGnn6lsKtL8hwxs540PVPO5Qz84/rEeQaTDthV4rGZfJEYddsbsV69vAa84JhN
	zIywItne4AUYnuSBNjwA7ZmKU/2MNFmShjxiKhbWWlbx0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3d6vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 10:43:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c760637fe5so155552085a.0
        for <linux-firmware@kernel.org>; Thu, 24 Apr 2025 03:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491384; x=1746096184;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6N1FQIC1Lzm+p6GnhvFs0n6BWeNky1KVyUhdKrdCk0=;
        b=trzduJPnvQm/xi15a22UaKyMoVL8sODU/a+JM+XFAiRGrBBLGkheyEhjujBwHZd1oS
         MlQbns654sX5hd1fc3/EZNfq9MRhtJXsiU+tiW/zk8LupYoMhr9miJEgBopNdWUxwdFi
         LFWJV1bz3UwzbFFjiXTdh+xwZafuH/ATmQ642vleBAg1MIkTUMleu5OS/v5R5CyML1V5
         BRiFZKQslPFUnQ9lQFQMTFr8yzQQtVttFaHn1Wbm/v8tBFbBLi3p2wxaqHYR0csBk5UU
         zo8gdS3beV8gknRDP5mynuLFdl/g2rLGccy2WWoRpEU+FwOG6Qizp6LabgIekxgGe0i2
         tDPg==
X-Gm-Message-State: AOJu0YzYTBJmTacLeEyKMQv35hZtvRbI3xIHJWot1CA6g0EmsTuznsto
	+rMl9F6QbTaK2VNLCdi4ZJz0EL0oo7OH3IZ7UHAYBTVBQMBZgsS6aCEy2acxMYM8501PpXI6OiX
	6VN5kdvqQUc2nACA1Glx49sJpK+8cttGcI8SPrHY/Hq7ZUXpUnbpbrK5Q5eE=
X-Gm-Gg: ASbGncsUBs+IUd9YfjnX4+c5YlXVQPMC1LZwlS+sNnx2kxmMPzp4Mtw7FRmLHP7ViXM
	jsEGqn8Lc09jFEobWUmAWfE7Pa+GlRD+NefAk3KuuIFaB3at4SR8QNuqiPR9quJriT3wYqU4j8N
	3Bu96je1FQ8DOnJNkyAWOuWWv80mEtWcQEAA5Uv2KSAPwdbGF7iGvIvbEz5MfWRdsk6zCIbSPR/
	Xf5+DrzM4h6sewNQRUs4q8TlIksuQwy6B4xa2CiZYdOhVEIsgp3ELLZ9jvCh5/jgG6EEvO1D+ih
	0X/tW1njUAkoQ7zIzDPD0AAtT5UaIenE+gC/VZJ07n7WL8ehWIdUFcm1LKd+8qS75CiP4Yz5NpM
	=
X-Received: by 2002:a05:620a:31aa:b0:7c5:d72b:1a00 with SMTP id af79cd13be357-7c956ee2cc5mr307703585a.15.1745491383964;
        Thu, 24 Apr 2025 03:43:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfB0NT8tqCxrPriJ9/XzTlf16C/CV6t943q/BjsW89QUitxxO+UZd3+vE2l8DULK3FuHGFbQ==
X-Received: by 2002:a05:620a:31aa:b0:7c5:d72b:1a00 with SMTP id af79cd13be357-7c956ee2cc5mr307701485a.15.1745491383645;
        Thu, 24 Apr 2025 03:43:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cca8f02sm187249e87.183.2025.04.24.03.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:43:02 -0700 (PDT)
Date: Thu, 24 Apr 2025 13:43:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
List-Id: <linux-firmware.lore.kernel.org>
Cc: linux-firmware@kernel.org,
        "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>
Subject: Re: update video firmware binary for SA8775p
Message-ID: <toxomfkw6v2cb4fys5s73tzahccfpxqsxp2hjt2r3xkge5qc5e@bgqtxusxvynl>
References: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <798a8c89-d977-603f-43a6-ea836d3f459f@quicinc.com>
X-Proofpoint-ORIG-GUID: iMK1EtVnVQQbt3crqGlAqmj-L0d3JUmF
X-Proofpoint-GUID: iMK1EtVnVQQbt3crqGlAqmj-L0d3JUmF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA3MSBTYWx0ZWRfX5n2dTRJ5FvpK l5EDPNpG6XxTDFVEUQ0Z+FDYWA4JRTd40agWG8j972s/2XZAGTfOLJmmYSXmwVQ4XsM5igQWbME sDdpUBAIncIuzQLIZmlZj7VfWkZlFCx/UvYmZmjVsxg+dJco++8umUnDO2PgiRncMVuF4Yh7Xfk
 jQd43YYNMWVye6dHYD5j1vPCKIcGYJlJxBxwDulpAVhbYU6Ne48uUgjBySYXdlkwK7cBKlPecfp q5DCL8CsNENVm5OQeS9e1fb/cwoC0ttES3pePJLX+oK7dzIwX8pqkHVeQUui55sxVJ0jP+n0hfM M3qkKMc4xGqHS7yn78n/lmuv318uIqsNFXz7arR5PpxwT8qWmrbcHpTpY46nXHQI+zZyNbQQyKY
 Y8G0tr2oysuNKrNDrSIFIKVC+p0A56N8m13zkE6Es/eJSKxFAXqrdODgK1sHGSmvfKq2TCJP
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680a15b9 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=qC_FGOx9AAAA:8 a=Bs8hf6ie9k7B1KQDAu8A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_05,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=690 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240071

On Thu, Apr 24, 2025 at 03:48:24PM +0530, Dikshita Agarwal wrote:
> Hi,
> 
> The following changes since commit c67433231cbd8bcf90b5563bed22fc7a62bbc2bc:
> 
>   Merge branch 'robot/pr-0-1745441634' into 'main' (2025-04-23 23:24:26 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.codelinaro.org/clo/linux-kernel/linux-firmware.git
> video-fw-SA8775p-16MB
> 
> for you to fetch changes up to ef226c72835b1f8521e855f5a12640b8991d1ef1:
> 
>   qcom: vpu: update video firmware binary for SA8775p (2025-04-24 15:07:18
> +0530)
> 
> ----------------------------------------------------------------
> Dikshita Agarwal (1):
>       qcom: vpu: update video firmware binary for SA8775p
> 
> WHENCE                        |   4 ++++
> qcom/vpu/vpu30_p4_s6_16mb.mbn | Bin 0 -> 2311988 bytes
> 2 files changed, 4 insertions(+)
> create mode 100644 qcom/vpu/vpu30_p4_s6_16mb.mbn

How this is going to be used / selected?

-- 
With best wishes
Dmitry
